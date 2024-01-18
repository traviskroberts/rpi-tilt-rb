class TiltDataController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    TiltData.create!(allowed_params)

    head :no_content
  end

  private
  def allowed_params
    params.permit(:name, :temp_fahrenheit, :temp_celsius, :gravity, :timestamp)
  end
end
