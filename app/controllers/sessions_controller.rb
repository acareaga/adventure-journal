class SessionsController < ApplicationController
  CALLBACK_URL = "http://localhost:3000/auth/instagram/callback"

  def create
    user = User.find_or_create(auth_info)
    if user
      Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
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
