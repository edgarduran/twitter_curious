require './test/test_helper'

class TwitterApiTest < ActiveSupport::TestCase

  def create_user
    User.create(name: "Nestor Duran",
    screen_name: "nesduran89",
    uid: ENV["uid"],
    oauth_token: ENV["oauth_token"],
    oauth_token_secret: ENV["oauth_token_secret"]
    )
  end

  test 'vcr setup correctly' do
    VCR.use_cassette("twitter_api#home") do
      user = create_user
      service = TwitterApi.new(user)

      assert_equal "Crushin' this API shit!", service.client.user_timeline.first.text
      assert_equal "Nestor Duran", service.client.user.name
      assert_equal "nesduran89", service.client.user.screen_name
      assert_equal 10, service.client.followers.count
      assert_equal 4, service.client.user_timeline.count
    end
  end

  test 'user uid is correct' do
    VCR.use_cassette("twitter_api#feed") do
      user = create_user
      service = TwitterApi.new(user)

      assert_equal ENV["uid"], service.client.verify_credentials.id.to_s
    end
  end

end
