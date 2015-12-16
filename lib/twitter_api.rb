class TwitterApi
  def self.public_tweets
    client.user_timeline('BBCNews')
  end

  def self.
  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      # for writing to twitter
      # config.access_token        = self.oauth_token
      # config.access_token_secret = self.oauth_token_secret
    end
  end

end
