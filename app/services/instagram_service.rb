class InstagramService
  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client = Instagram.client(:access_token => user[:oauth_token])
  end

  def user_posts
    client.user_recent_media(user.uid, {:count => 20})
  end

  def recent_feed(params)
    tags = client.tag_search(params)
    client.tag_recent_media(tags[0].name)
  end
end
