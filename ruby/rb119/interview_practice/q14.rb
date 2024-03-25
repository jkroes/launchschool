#!/usr/bin/env ruby

# 5:51
# 6:00

# Input: Integer
# Return: integer sum of all multiples of 7 or 11 less than the
# argument.
# Requirements:
# - Sum multiples of 7 and 11 once
# - Return 0 for negative numbers (multiples cannot be negative)
# Algorithm:
# Create an array of multiples of 7 less than input
# Create an array of multiples of 11 less than input
# Concatenate the arrays, then find the unique elements
# sum them

def seven_eleven(limit)
  sevens = (7...limit).step(7)
  elevens = (11...limit).step(11)
  (sevens + elevens).uniq.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

