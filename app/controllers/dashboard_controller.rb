class DashboardController < ApplicationController

  def show
    @user_posts = Media.user_posts(current_user) while current_user
  end
end
