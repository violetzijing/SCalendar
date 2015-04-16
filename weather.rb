#!/usr/bin/env ruby

require 'httparty'
require 'json'
require 'pry'

response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=Beijing")

weather_list = JSON.parse(response.body)['list']

scalendar = Hash.new

E  = 20
NE = 10
N  = -40
NW = -20
W  = 0
SW = 20
S  = 50
SE = 40

for i in 0..37
  pullotion = 150

  wind_deg = weather_list[i]['wind']['deg']
  wind_speed = weather_list[i]['wind']['speed']
  time = weather_list[i]['dt_txt']
  month = weather_list[i]['dt_txt'].split('-')[1].to_i

  # Calculate pullotion according to wind direction
  if (0..23) === wind_deg
    pullotion += N
  elsif (24..69) === wind_deg
    pullotion += NW
  elsif (70..115) === wind_deg
    pullotion += W
  elsif (116..160) === wind_deg
    pullotion += SW
  elsif (161..205) === wind_deg
    pullotion += S
  elsif (206..250) === wind_deg
    pullotion += SE
  elsif (251..295) === wind_deg
    pullotion += E
  elsif (296..341) === wind_deg
    pullotion += NE
  elsif (341..360) === wind_deg
    pullotion += N
  end

  # Calculate pullotion according to month
  if (11..3) === month
    pullotion *= 1.5
  end

  # Calculate pullotion according to wind speed
  if (0..3) === wind_speed
    if (116..250) === wind_deg
      pullotion *= 1.2
    else
      pullotion *= 0.9
    end
  elsif (4..7) === wind_speed
    if (116..250) === wind_deg
      pullotion *= 1.25
    else
      pullotion *= 0.58
    end
  elsif (8..15) === wind_speed
    if (116..250) === wind_deg
      pullotion *= 1.3
    else
      pullotion *= 0.4
    end
  elsif (16..25) === wind_speed
    if (116..250) === wind_deg
      pullotion *= 1.35
    else
      pullotion *= 0.25
    end
  elsif (26..40) === wind_speed
    if (116..250) === wind_deg
      pullotion *= 0.8
    else
      pullotion *= 0.16
    end
  else
    pullotion = 1024
  end

  scalendar[['PM2.5', time]] = pullotion
  i -= 1
end

puts scalendar
