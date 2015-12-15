class FeedController < ApplicationController

  def show
    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
  end
end
