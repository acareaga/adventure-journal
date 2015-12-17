class FeedController < ApplicationController

  def index
    @recent_feed = Media.search_by_tag(current_user, 'berner')
  end

  def create
    @recent_feed = Media.search_by_tag(current_user, params[:q])
    redirect_to root_path
  end
end
