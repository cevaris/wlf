module ApplicationHelper
  def current_account
    if user_signed_in? and current_user
      return current_user.account
    else
      return false
    end
  end
end
