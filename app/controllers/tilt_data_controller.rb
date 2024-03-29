class TiltDataController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    beer = Beer.where(name: params[:name]).first_or_create!

    beer.update(
      alcohol_by_volume: params[:alcohol_by_volume],
      apparent_attenuation: params[:apparent_attenuation]
    )

    beer.tilt_data.create!(
      gravity: params[:gravity].to_f.round(4),
      temp_celsius: params[:temp_celsius],
      temp_fahrenheit: params[:temp_fahrenheit],
      timestamp: params[:timestamp]
    )

    head :no_content
  end
end
