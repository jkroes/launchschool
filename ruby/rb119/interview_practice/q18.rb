#!/usr/bin/env ruby

# 8:49
# 9:06

# Input: array of integers
# Return: least index that partitions an array into
# equally-summed halves; or else -1

# Requirements:
# - Don't include the element whose index partitions the array in
# either sum.
# - The sum to the left of index 0 or to the right of the last
# index is 0. This means that if your return these indices, the
# array excluding the partition index must sum to zero

# Algorithm:
# Init sum = 0
# Iterate through the indices of the array
# Split the array at the index
# Sum the two arrays
# if the two arrays are equal, return the index

def equal_sum_index(integers)
  integers.each_index do |i|
    a1 = integers[0...i]
    a2 = integers[i+1..-1]
    return i if a1.sum == a2.sum
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
