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
    client.user("edgarduran303")
  end

  def followers
    client.followers("edgarduran303")
  end

  def following
    client.friends("edgarduran303")
  end

  def tweets
    client.user_timeline("edgarduran303")
  end

end
