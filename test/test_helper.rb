ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end
class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = ApiCurious::Application
  end

  def teardown
    reset_session!
  end

end
