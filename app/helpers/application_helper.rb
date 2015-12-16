module ApplicationHelper

  def login_logout_path
    if current_user
      link_to "logout", logout_path
    else
      link_to "login", login_path
    end
  end

  def user_profile_path
    if current_user
      link_to "#{current_user.username}", dashboard_path(current_user.username)
    end
  end
end
