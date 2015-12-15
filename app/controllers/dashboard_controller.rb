class DashboardController < ApplicationController

  def show
    client = Instagram.client(:access_token => current_user[:oauth_token])
    @user = current_user
    @user_posts  = client.user_recent_media( @user.uid, {:count => 20})
    # @user_posts = Media.user_posts(current_user)
  end
end
