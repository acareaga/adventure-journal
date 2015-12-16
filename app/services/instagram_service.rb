class InstagramService
  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client = Instagram.client(:access_token => user[:oauth_token])
  end

  def user_posts
    client.user_recent_media(user.uid, {:count => 20})
  end

  def search_by_tag
    tags = client.tag_search('berner')
    client.tag_recent_media(tags[0].name)
  end
end
