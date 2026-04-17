require "faraday"
require "json"

# Executes a COS runbook (daily-brief / weekly-wrap / monthly-review) by
# feeding the playbook + relevant cos/ markdown into Claude and writing the
# returned brief to cos/briefs/<scope>/<date>.md.
#
# Prompt shape:
#   system[0]  = CLAUDE.md               ← stable across rhythms; cached.
#   system[1]  = playbook + context md   ← varies per run; not cached.
#   user       = "execute the runbook for today"
#
# No DB persistence. Source of truth is the written brief file under cos/.
class PlaybookRunner
  ANTHROPIC_ENDPOINT = "https://api.anthropic.com/v1/messages"
  ANTHROPIC_VERSION  = "2023-06-01"
  DEFAULT_MODEL      = "claude-sonnet-4-6"
  MAX_TOKENS         = 8192

  def initialize(playbook:, output_dir:, date_format:, context_files: [], model: DEFAULT_MODEL)
    @playbook_path  = Rails.root.join(playbook)
    @output_dir     = Rails.root.join(output_dir)
    @date_format    = date_format
    @context_files  = context_files.map { |p| Rails.root.join(p) }
    @model          = model
  end

  def run
    @output_dir.mkpath
    output_path = @output_dir.join("#{Time.zone.now.strftime(@date_format)}.md")
    output_path.write(generate_brief)
    Rails.logger.info("PlaybookRunner wrote #{output_path}")
    output_path
  end

  private

  def generate_brief
    response = Faraday.post(ANTHROPIC_ENDPOINT) do |req|
      req.headers["x-api-key"]          = api_key
      req.headers["anthropic-version"]  = ANTHROPIC_VERSION
      req.headers["content-type"]       = "application/json"
      req.body = request_body.to_json
    end

    unless response.status == 200
      raise "Anthropic API error (#{response.status}): #{response.body}"
    end

    body = JSON.parse(response.body)
    text = body.dig("content", 0, "text")
    raise "Empty Anthropic response: #{body.inspect}" if text.to_s.strip.empty?
    text
  end

  def request_body
    {
      model: @model,
      max_tokens: MAX_TOKENS,
      system: [
        { type: "text", text: governing_context, cache_control: { type: "ephemeral" } },
        { type: "text", text: playbook_and_context }
      ],
      messages: [
        { role: "user", content: user_prompt }
      ]
    }
  end

  # Stable across rhythms (cacheable).
  def governing_context
    "# CLAUDE.md (governing chief-of-staff doc)\n\n#{File.read(Rails.root.join('CLAUDE.md'))}"
  end

  # Per-rhythm content — playbook + the context files the caller specified.
  def playbook_and_context
    sections = ["# Playbook runbook to execute\n\n#{File.read(@playbook_path)}"]
    @context_files.each do |path|
      next unless path.exist?
      sections << "# #{path.relative_path_from(Rails.root)}\n\n#{File.read(path)}"
    end
    sections.join("\n\n---\n\n")
  end

  def user_prompt
    now = Time.zone.now
    <<~PROMPT.strip
      Today is #{now.strftime('%A, %Y-%m-%d %H:%M %Z')}. Execute the runbook above against the context files provided. Produce the brief per the runbook's template — markdown only, no preamble, no commentary wrapping the output.
    PROMPT
  end

  def api_key
    ENV.fetch("ANTHROPIC_API_KEY") do
      raise "ANTHROPIC_API_KEY not set. Run bin/env-decrypt or add it to .env."
    end
  end
end
