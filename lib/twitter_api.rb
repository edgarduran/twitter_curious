class TwitterApi
  attr_reader :client

  def initialize(current_user)
    @current_user = current_user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = @current_user.oauth_token
      config.access_token_secret = @current_user.oauth_token_secret
    end
  end

  def homepage_tweets
    client.home_timeline
  end

  def public_tweets
    client.user_timeline('SportsCenter')
  end

  def user_info
    client.user
  end

  def followers
    client.followers
  end

  def following
    client.friends
  end

  def tweets
    client.user_timeline
  end

  def send_tweet(message)
    client.update(message)
  end

  def follow(user)
    client.follow(user)
  end

  def friends
    client.friends
  end

end
