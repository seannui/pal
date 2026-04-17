# Executes a COS runbook (daily-brief / weekly-wrap / monthly-review) and
# writes the output to the right briefs/ subdirectory.
#
# v0.1: stub that writes a placeholder brief. Proves the scheduler wiring.
# v0.1.1 (next commit): swap the stub for a real Claude API call that
# feeds the playbook + relevant cos/ markdown into the prompt and writes
# the returned brief.
class PlaybookRunner
  COS_ROOT = Rails.root.join("cos")

  def initialize(playbook:, output_dir:, date_format:, context_files: [])
    @playbook_path = Rails.root.join(playbook)
    @output_dir = Rails.root.join(output_dir)
    @date_format = date_format
    @context_files = context_files.map { |p| Rails.root.join(p) }
  end

  def run
    @output_dir.mkpath
    output_path = @output_dir.join("#{Time.zone.now.strftime(@date_format)}.md")
    output_path.write(stub_brief)
    Rails.logger.info("PlaybookRunner wrote #{output_path}")
    output_path
  end

  private

  def stub_brief
    <<~MD
      # Brief — #{Time.zone.now.strftime("%A, %Y-%m-%d %H:%M %Z")}

      *v0.1 stub — the scheduler wiring works. Claude API integration lands in v0.1.1.*

      **Playbook:** `#{@playbook_path.relative_path_from(Rails.root)}`
      **Context files the next version will pull in:**
      #{@context_files.map { |p| "  - `#{p.relative_path_from(Rails.root)}`" }.join("\n")}

      This brief was written by Solid Queue on schedule. When the Claude API call is wired,
      this placeholder becomes a real brief derived from the playbook + cos/ markdown.
    MD
  end
end
