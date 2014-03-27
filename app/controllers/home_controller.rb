class HomeController < ApplicationController
  def index
    #result = request.location
    if Rails.env == "production"
    @lat = result.latitude
    @lang = result.longitude
    else
    @lat =  27.175015
    @lang = 78.042155
    end
    
    redirect_to new_user_session_path unless current_user
  end
end
