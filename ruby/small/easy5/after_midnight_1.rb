#!/usr/bin/env ruby

# NOTE Review this answer and the Date and Time classes. There's
# a lot more to learn about them.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
SECONDS_PER_MINUTE = 60

def time_of_day(int)
  hours, minutes = int.divmod(MINUTES_PER_HOUR)
  hours = hours % HOURS_PER_DAY
  hours = hours.negative? ? HOURS_PER_DAY + hours : hours
  format("%02d:%02d", hours, minutes)
end

# Further explorations 1

def time_of_day(delta_minutes)
  minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# Further explorations 2

def time_of_day(delta_minutes)
  # Time object with arbitrary date. The time component defaults
  # to midnight. Addition is in terms of seconds.
  time = Time.new(0,1,1) + SECONDS_PER_MINUTE * delta_minutes
  format('%02d:%02d', time.hour, time.min)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Further explorations 3

def time_of_day(delta_minutes)
  require 'date'
  delta_days, minutes = delta_minutes.divmod(MINUTES_PER_DAY)
  weekday = Date::DAYNAMES[delta_days]
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
  format('%s %02d:%02d', weekday, hours, minutes)
end

puts
p time_of_day(-4231) == "Thursday 01:29"
