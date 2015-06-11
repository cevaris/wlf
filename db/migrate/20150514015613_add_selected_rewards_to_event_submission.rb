class AddSelectedRewardsToEventSubmission < ActiveRecord::Migration
  def change
    add_column :event_submissions, :selected_rewards, :string
  end
end
