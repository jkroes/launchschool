#!/usr/bin/env ruby

# NOTE You should use &:to_i instead of the block argument to
# map. You should get comfortable with this syntax because of
# how efficient it is to read and write.

# NOTE A user had a brilliant solution for before_midnight. (My
# original solution is commented out.)

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = SECONDS_PER_MINUTE
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_string)
  hours, minutes = time_string.split(":").map { |str| str.to_i }
  hours % HOURS_PER_DAY * MINUTES_PER_HOUR + minutes
end

# def before_midnight(time_string)
#   (MINUTES_PER_DAY - after_midnight(time_string)) %
#     MINUTES_PER_DAY
# end

def before_midnight(time_string)
  -after_midnight(time_string) % MINUTES_PER_DAY
end

# Further exploration

# NOTE Time is 24-hour-based, which is why this example works

def after_midnight(time_string)
  require 'time'
  time = Time.parse(time_string)
  time.hour * MINUTES_PER_HOUR + time.min
end

# NOTE This is more verbose, but it is logically straight
# forward. Do simple arithmetic with a time object and number of
# seconds to yield a second time object. Extract the new time
# components and convert to minutes.

def before_midnight(time_string)
  time = Time.new(0,1,1) -
         after_midnight(time_string) * SECONDS_PER_MINUTE
  time.hour * MINUTES_PER_HOUR + time.min
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
