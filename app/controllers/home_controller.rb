class HomeController < ApplicationController

  def home
    if current_user
    @twitter ||= twitter_api
  else
    redirect_to welcome_path
  end
  end


  private
  def twitter_api
    TwitterApi.new(current_user)
  end

end
