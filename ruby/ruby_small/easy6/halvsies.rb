#!/usr/bin/env ruby

def halvsies(array)
  size = array.size
  size = size.odd? ? size + 1 : size
  [array[0, size/2], array[size/2..-1]]
end

# NOTE The use of #ceil and floating-point division instead of
# the ternary operator. The slice syntax here.

# example solution
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

# NOTE another user's solution that mixes exclusive and inclusive
# range
def halvsies(array)
  mid_point = (array.size / 2.0).round
  [array[0...mid_point], array[mid_point..-1]]
end

# NOTE a second user's solution showing a way to additionally
# pass an index to the block passed to partition. Investigate the
# difference between Enumerable and Enumerator
def halvsies(array)
  array.partition.with_index do |element, i|
    i < (array.size / 2.0).ceil
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
