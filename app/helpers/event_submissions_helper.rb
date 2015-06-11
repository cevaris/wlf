module EventSubmissionsHelper

  def get_event_rewards(selected_rewards_hash)
    EventReward.find(
      selected_rewards_hash.reject(&:empty?).map(&:to_i)
    )
  end

  def calculate_event_rewards_total(selected_rewards)
    Money.new(
      if selected_rewards.empty?
        0
      else
        selected_rewards.map(&:price).sum
      end
    )
  end
end
