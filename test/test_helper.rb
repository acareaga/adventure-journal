ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require "minitest/pride"
require "pry"

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def login_user
    visit root_path
    click_link "login"
    fill_in "username", with: "powskiing"
    fill_in "password", with: "password"
    click_link "Log in"
  end
end
