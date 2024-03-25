#!/usr/bin/env ruby

# 10:25
# 10:40

# Problem:
# Create a method
# Input: Array of integers
# Output: New array whose elements are the pair of numbers that
# are closest together.
# For positive numbers, this is the difference. For negative
# numbers, this is the absolute difference. No negative number
# test cases, so use simple difference.

# Problem:
# Create a method
# Input: Array of integers
# Output: New array with the pair of numbers that have a minimum
# difference.

# Requirements:
# Break ties in min. difference with first pair in original
# array.
# Numbers in return value do not need to be contiguous in the
# input array
# All numbers are positive
# Possible edge cases:
# - Empty array
# - Array of one element

# Problem:
# Create a method
# Input: Array of integers
# Output: New array with the pair of numbers that have a minimum
# difference, breaking ties by minimum index of first number in pair

# Algorithm:
# Find all pairs of integers in the input array
# Find pairs with min diff
# Select pair with min sum of elements' indices in input array

def pairs(numbers)
  numbers.combination(2)
end

def closest_numbers(numbers)
  pairs(numbers).min_by { |pair| (pair[0] - pair[1]).abs }
end

# p closest_numbers([]) == nil
# p closest_numbers([1]) == nil
p closest_numbers([5, 105, 101, 25, 15, 11, 20]) == [105, 101]
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
