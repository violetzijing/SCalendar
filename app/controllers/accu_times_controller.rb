class AccuTimesController < ApplicationController
  def create
    @accu_time = AccuTime.new
    @accu_time.time = Time.new(time: Time.new)
  end
end
