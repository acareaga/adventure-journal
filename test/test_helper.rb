ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require "minitest/pride"
require "pry"
# require 'webmock'
# require 'vcr'

class ActiveSupport::TestCase
  fixtures :all

  # VCR.configure do |config|
  #   config.cassette_library_dir = "test/cassettes"
  #   config.hook_into :webmock
  # end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def login_user
    visit root_path
    click_link "login"
    fill_in "username", with: "aaronturing"
    fill_in "password", with: "turingpass"
    click_link "Log in"
  end
end
