class WeeklyWrapJob < ApplicationJob
  queue_as :default

  def perform
    PlaybookRunner.new(
      playbook: "cos/playbook/weekly-wrap.md",
      output_dir: "cos/briefs/weekly",
      date_format: "%Y-%V",
      context_files: [
        "cos/commitments/open.md",
        "cos/commitments/closed.md",
        "cos/ventures/union.md"
      ]
    ).run
  end
end
