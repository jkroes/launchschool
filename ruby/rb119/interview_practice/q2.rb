#!/usr/bin/env ruby

# 9:45
# 10:04

# Problem:
# Create a method
# - Input: array of integers
# - Return: If there are at least five consecutive numbers, the
#   minimum sum of these elements; else nil
# - Numbers are integers (positive, zero, negative)
# - No edge cases (empty array is the same as e.g. four elements)
# Algorithm:
# Return nil for array size < 5
# Find all length-5 subarrays of the input array (subprocess)
# Find the sum of each one
# Return the minimum sum

def subarrays(array)
  sub_arrays = []
  array.size.times do |i|
    (1..array.size-i).each do |j|
      sub_arrays << array[i, j]
    end
  end
  sub_arrays
end

def minimum_sum(numbers)
  subarrays(numbers).filter { |sub_ary| sub_ary.length == 5 }.map(&:sum).min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
