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
end
