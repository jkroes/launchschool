#!/usr/bin/env ruby

# NOTE The commented example solution uses a different approach
# with divmod, where the smallest unit (seconds) is always the
# numerator for divmod. I think my solution is more straight
# forward. I did comment out my original format statement in
# favor of the example. Notice how format allows you to mix
# string interpolation (of variable names) with format specs!
# It's a lot easier to understand.

DEGREE = "\xC2\xB0"

def split_number_on_decimal(numerator)
  quotient, modulus = numerator.divmod(1)
end

def dms(float)
  degrees, minute_frac = split_number_on_decimal(float)
  minutes, second_frac = split_number_on_decimal(minute_frac * 60)
  seconds = second_frac * 60
  # format("%d%s%02d%s%02d%s", degrees, DEGREE, minutes, ?', seconds, ?")
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# Results should be within one second of the commented results,
# due to differences in rounding.
puts dms(30)        # %(30°00'00")
puts dms(76.73)     # %(76°43'48")
puts dms(254.6)     # %(254°36'00")
puts dms(93.034773) # %(93°02'05")
puts dms(0)         # %(0°00'00")
puts dms(360)       # %(360°00'00") || dms(360) == %(0°00'00")

# Further exploration

def standard_degrees(degs)
  degs % 360
end

def dms2(float)
  degrees, minute_frac = split_number_on_decimal(standard_degrees(float))
  minutes, second_frac = split_number_on_decimal(minute_frac * 60)
  seconds = second_frac * 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts
puts dms2(400)  == %(40°00'00")
puts dms2(-40)  == %(320°00'00")
puts dms2(-420) == %(300°00'00")
