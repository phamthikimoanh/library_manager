module ApplicationHelper
  def current_user && current_user.admin?
    false
  end
end