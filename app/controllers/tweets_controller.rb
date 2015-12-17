class TweetsController < ApplicationController

  def create
    tweet = twitter_api
    tweet.send_tweet(params[:tweet][:message])
    redirect_to home_path 
  end

  private
  def twitter_api
    TwitterApi.new(current_user)
  end

end
