require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = ApiCurious::Application
    stub_omniauth
  end

  test 'user can login with twitter and is redirected to root' do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/", current_path
    assert page.has_content?("Horace")
    assert page.has_link?("Logout")
  end

  def stub_omniauth

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Horace",
          screen_name: "worace",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end

end
