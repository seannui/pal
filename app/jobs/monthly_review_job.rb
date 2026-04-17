class MonthlyReviewJob < ApplicationJob
  queue_as :default

  # Recurring cron fires every Monday 7:03 MT; gate to the *first* Monday only.
  def perform
    return unless first_monday_of_month?
    PlaybookRunner.new(
      playbook: "cos/playbook/monthly-review.md",
      output_dir: "cos/briefs/monthly",
      date_format: "%Y-%m",
      context_files: [
        "cos/commitments/open.md",
        "cos/commitments/closed.md",
        "cos/ventures/union.md",
        "cos/people/katy-strot.md"
      ]
    ).run
  end

  private

  def first_monday_of_month?
    today = Date.current
    today.monday? && today.day <= 7
  end
end
