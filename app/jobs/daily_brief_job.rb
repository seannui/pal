class DailyBriefJob < ApplicationJob
  queue_as :default

  def perform
    PlaybookRunner.new(
      playbook: "cos/playbook/daily-brief.md",
      output_dir: "cos/briefs/daily",
      date_format: "%Y-%m-%d",
      context_files: [
        "cos/commitments/open.md",
        "cos/ventures/union.md",
        "cos/inbox/gaps.md"
      ]
    ).run
  end
end
