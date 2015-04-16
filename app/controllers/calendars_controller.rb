class CalendarsController < ApplicationController
  def create
    @calendar = Calendar.new
  end
end
