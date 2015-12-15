ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def login_user
    visit root_path
    click_link "Login"
    fill_in "username", with: "powskiing"
    fill_in "password", with: "password"
    click_link "Log in"
  end
end
