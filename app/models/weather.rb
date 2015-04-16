class Weather < ActiveRecord::Base
  validates :main, presence: true
  validates :temp, presence: true
  validates :temp_min, presence: true
  validates :temp_max, presence: true
  validates :pressure, presence: true
  validates :wind_speed, presence: true
  validates :wind_degree, presence: true

  belongs_to :accu_time

  attr_reader :main
  attr_reader :temp
  attr_reader :temp_min
  attr_reader :temp_max
  attr_reader :pressure
  attr_reader :wind_speed
  attr_reader :wind_degree


  def wind_direction
    if (0..23) === self.wind_degree
      return "N"
    elsif (24..69) === self.wind_degree
      return "NW"
    elsif (70..115) === self.wind_degree
      return "W"
    elsif (116..160) === self.wind_degree
      return "SW"
    elsif (161..205) === self.wind_degree
      return "S"
    elsif (206..250) === self.wind_degree
      return "SE"
    elsif (251..295) === self.wind_degree
      return "E"
    elsif (296..341) === self.wind_degree
      return "NE"
    elsif (341..360) === self.wind_degree
      return "N"
    end
  end
end
