class Media < ActiveRecord::Base
  attr_reader :service

  def self.service(user)
    @service ||= InstagramService.new(user)
  end

  def self.user_posts(user)
    service(user).user_posts
  end

  def self.search_by_tag(user, tag)
    service(user).search_by_tag(tag)
  end

  def self.like_post(user, id)
    service(user).like_post(id)
  end

  def self.unlike_post(user, id)
    service(user).unlike_post(id)
  end
end
