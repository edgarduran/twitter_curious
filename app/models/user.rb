class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def twitter
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.oauth_token
      config.access_token_secret = self.oauth_token_secret
    end
  end

  # client = Twitter::REST::Client.new do |config|
  #   config.consumer_key        = "YOUR_CONSUMER_KEY"
  #   config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  #   config.access_token        = "YOUR_ACCESS_TOKEN"
  #   config.access_token_secret = "YOUR_ACCESS_SECRET"
  # end

end
