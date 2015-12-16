class FeedController < ApplicationController

  def index
    if current_user
      client = Instagram.client(:access_token => current_user[:oauth_token])
      @user = current_user
      # binding.pry
      tags = client.tag_search('berner')
      @recent_feed = client.tag_recent_media(tags[0].name)
    end
  end
end
