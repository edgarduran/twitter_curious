require 'test_helper'

class UserCanViewTheirTweetsTest < ActionDispatch::IntegrationTest

  test 'a logged in user can see a list of recent tweets' do
    visit '/'
    click_link "Login"
    assert page.has_content?("Horace")
    assert page.has_link?("Logout")

    click_link "My Profile"

    assert page.has_content("Edgar Duran")
    assert page.has_content("@edgarduran303")
    assert page.has_content("Tweets & Replies")

  end


end
