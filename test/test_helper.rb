ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require "minitest/pride"
require "pry"
require 'webmock'
require 'vcr'
require 'simplecov'

SimpleCov.start "rails"

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      "provider"=>"instagram",
      "uid"=>"2331596714",
      "info"=>{
        "nickname"=>"aaronturing",
        "name"=>"Aaron",
        "email"=>nil,
        "image"=>"https://scontent.cdninstagram.com/hphotos-xtp1/t51.2885-19/s150x150/12338859_189639354716935_1184283222_a.jpg",
        "bio"=>"Turing test",
        "website"=>""},
      "credentials"=>{"token"=>"2331596714.2dd2c36.bd9e537a6ecc4b6ea85b0cc9f22a5779", "expires"=>false},
      "extra"=>{
        "raw_info"=>{
          "username"=>"aaronturing",
          "bio"=>"Turing test",
          "website"=>"",
          "profile_picture"=>"https://scontent.cdninstagram.com/hphotos-xtp1/t51.2885-19/s150x150/12338859_189639354716935_1184283222_a.jpg",
          "full_name"=>"Aaron",
          "id"=>"2331596714"
          }}})
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      "provider"=>"instagram",
      "uid"=>"2331596714",
      "info"=>{
        "nickname"=>"aaronturing",
        "name"=>"Aaron",
        "email"=>nil,
        "image"=>"https://scontent.cdninstagram.com/hphotos-xtp1/t51.2885-19/s150x150/12338859_189639354716935_1184283222_a.jpg",
        "bio"=>"Turing test",
        "website"=>""},
      "credentials"=>{"token"=>"2331596714.2dd2c36.bd9e537a6ecc4b6ea85b0cc9f22a5779", "expires"=>false},
      "extra"=>{
        "raw_info"=>{
          "username"=>"aaronturing",
          "bio"=>"Turing test",
          "website"=>"",
          "profile_picture"=>"https://scontent.cdninstagram.com/hphotos-xtp1/t51.2885-19/s150x150/12338859_189639354716935_1184283222_a.jpg",
          "full_name"=>"Aaron",
          "id"=>"2331596714"
          }}})
  end
end
