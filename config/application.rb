require File.expand_path('../boot', __FILE__)
require 'rails/all'
require 'json'
require "instagram"

Bundler.require(*Rails.groups)

module AdventureJournal
  class Application < Rails::Application

    Instagram.configure do |config|
      config.client_id = ENV["insta_client_id"]
      config.client_secret = ENV["insta_secret_key"]
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
