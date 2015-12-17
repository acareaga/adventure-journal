class InstagramService
  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client = Instagram.client(:access_token => user[:oauth_token])
  end

  def user_posts
    client.user_recent_media(user.uid, {:count => 20})
  end

  def search_by_tag(tag)
    tags = client.tag_search(tag)
    client.tag_recent_media(tags[0].name)
  end

  def like_post(id)
    client.like_media(id)
  end

  def unlike_post(id)
    client.unlike_media(id)
  end
end
