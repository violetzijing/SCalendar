class WeathersController < ApplicationController
  def create
    @accu_time = AccuTime.new()
    @weather = @accu_time.weather.create
  end
end
