class Media < ActiveRecord::Base
  attr_reader :client

  def self.service
    InstagramService.new
  end

  def self.user_info(token)
    build_object(service.user_info(token))
  end

  def self.search_by_tag(tag, token)
    build_object(service.search_by_tag(tag, token))
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
