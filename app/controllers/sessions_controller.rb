class SessionsController < ApplicationController

  def create
    user = User.find_or_create(auth_info)
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def auth_info
    request.env["omniauth.auth"]
  end
end
