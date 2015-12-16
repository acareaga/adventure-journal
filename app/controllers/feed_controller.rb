class FeedController < ApplicationController

  def index
    if current_user
      @recent_feed = Media.search_by_tag(current_user)
    end
  end
end
