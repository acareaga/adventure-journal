class FeedController < ApplicationController

  def index
    client = Instagram.client(:access_token => current_user[:oauth_token])
    @user = current_user
    @recent_feed = client.media_popular({:count => 20})
  end
end
