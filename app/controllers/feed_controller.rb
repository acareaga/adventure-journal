class FeedController < ApplicationController

  def index
    if current_user
      @recent_feed = Media.search_by_tag(current_user, 'berner')
    end
  end

  def create
    @recent_feed = Media.search_by_tag(current_user, params[:q])
    redirect_to results_path(params)
  end

  def show
    @recent_feed = Media.search_by_tag(current_user, params[:q])
  end

  def like_post
    @like_post = Media.like_post(current_user, id)
  end

  def unlike_post
    @unlike_post = Media.unlike_post(current_user, id)
  end
end
