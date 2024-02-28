#!/usr/bin/env ruby

# The results are difficult to predict. I believe it would output
# 1 and 3, because internally each is indexing numbers to get the
# value and the size of numbers is being reduced by one each
# iteration.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# This outputs 1 and 2. After this, there are only two elements
# in the array but iteration would try to find the third element.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
