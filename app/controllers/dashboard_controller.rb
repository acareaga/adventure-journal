class DashboardController < ApplicationController

  def show
    client = Instagram.client(:access_token => current_user[:oauth_token])
    @user = current_user
    @instagram = client.user_recent_media( @user.uid, {:count => 20})
  end
end
