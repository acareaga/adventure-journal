class InstagramService
  attr_reader :client

  def initialize
    @client = Instagram.client(:access_token => current_user[:oauth_token])
  end

  def user_dashboard
    client.user_recent_media( current_user.uid, {:count => 20})
  end
end
