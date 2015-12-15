class SessionsController < ApplicationController

  def create
    user = User.find_or_create(auth_info)
    if user
      session[:access_token] = user.oauth_token
      session[:user_id] = user.id
      session[:uid] = user.uid
    end
    redirect_to root_path
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
