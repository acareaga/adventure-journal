class FeedController < ApplicationController

  def index
    @recent_feed = Media.search_by_tag(current_user) while current_user
  end
end
