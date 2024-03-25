#!/usr/bin/env ruby

# 9:08
# 9:12

# Input: array of integers
# Return: an integer that appears an odd number of times
# rules:
# - there is exactly one such return value in the test cases
# Algorithm:
# For kicks, I won't use tally
# init a hash
# Iterate over each element of the array
# count that element in the array
# return when it is odd

def odd_fellow(numbers)
  numbers.each do |n|
    return n if numbers.count(n).odd?
  end
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0
