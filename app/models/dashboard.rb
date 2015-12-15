class Dashboard

  def self.service
    InstagramService.new
  end

  def self.user_posts
    service.user_dashboard
  end
end
