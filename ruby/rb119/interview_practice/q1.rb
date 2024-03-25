#!/usr/bin/env ruby

# start 12:24
# end 12:34

# input: array of numbers
# output: array of numbers
# Problem: Transform each numeric element into the number of
# unique elements less than it.
# Algorithm:
# Iterate over each number.
# - Create a sorted array of unique elements.
# - Find the index of the number in this array.
# Return an array of these indexes.

def smaller_numbers_than_current(numbers)
  unique = numbers.uniq.sort
  num_less = numbers.map do |num|
    unique.index num
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result
