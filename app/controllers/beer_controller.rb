class BeerController < ApplicationController
  before_action :require_user

  def show
    @beer = Beer.find_by!(slug: params[:id])
    tilt_data = @beer.tilt_data.order(:timestamp)

    @gravity_data = []
    @temp_data = []

    tilt_data.map do |d|
      timestamp = d.timestamp.strftime('%m-%e-%y %H:%M')
      @gravity_data << [timestamp, d.gravity]
      @temp_data << [timestamp, d.temp_fahrenheit]
    end

    gravities = tilt_data.pluck(:gravity)
    @max_gravity = (gravities.max + 0.005).round(4)
    @min_gravity = (gravities.min - 0.005).round(4)

    temps = tilt_data.pluck(:temp_fahrenheit)
    @max_temp = temps.max + 2
    @min_temp = temps.min - 2
  end
end
