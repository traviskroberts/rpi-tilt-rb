class PagesController < ApplicationController
  def index
    tilt_data = TiltData.order(:timestamp)

    @gravity_data = []
    @temp_data = []

    tilt_data.map do |d| 
      timestamp = d.timestamp.strftime('%m-%e-%y %H:%M')
      @gravity_data << [timestamp, d.gravity]
      @temp_data << [timestamp, d.temp_fahrenheit]
    end

    gravities = tilt_data.pluck(:gravity)
    @max_gravity = gravities.max + 0.005
    @min_gravity = gravities.min - 0.005

    temps = tilt_data.pluck(:temp_fahrenheit)
    @max_temp = temps.max + 2
    @min_tem = temps.min - 2
  end
end
