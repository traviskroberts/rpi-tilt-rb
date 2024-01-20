class TiltDataController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    TiltData.create!(
      name: params[:name],
      gravity: params[:gravity].round(4),
      temp_celsius: params[:temp_celsius],
      temp_fahrenheit: params[:temp_fahrenheit],
      timestamp: params[:timestamp]
    )

    head :no_content
  end
end
