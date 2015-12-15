class Media < ActiveRecord::Base
  attr_reader :client

  def self.service
    InstagramService.new
  end

  def self.user_posts(current_user)
    service.user_recent_media( current_user.uid, {:count => 12})
  end
end
