class DashboardController < ApplicationController

  def show
    if current_user
      @user_posts = Media.user_posts(current_user)
    end
  end
end
