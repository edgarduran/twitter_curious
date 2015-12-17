require './test/test_helper'

class TwitterApiTest < ActiveSupport::TestCase

  def create_user
    User.create(name: "Edgar Duran",
    screen_name: "edgarduran303",
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
