module ApplicationHelper
  def current_account
    if user_signed_in? and current_user
      return current_user.account
    else
      return false
    end
  end

  def payment_card_years
    Date.today.year.. 15.years.from_now.year
  end

  def formatted_date(date, timezone, format=:llllz)
    unless date.nil?
      I18n.l date.in_time_zone(timezone), format: format
    else
      nil
    end
  end
end
