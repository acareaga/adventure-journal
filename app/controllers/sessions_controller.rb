class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
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

  def callback_url
    "http://127.0.0.1:3000/auth/instagram/callback"
  end
end
