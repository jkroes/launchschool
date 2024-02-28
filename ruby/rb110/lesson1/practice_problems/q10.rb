#!/usr/bin/env ruby

# The return value is [1, nil, nil]. The block returns each number
# not greater than 1 in the array. For numbers greater than 1, it
# outputs the number and returns nil. Map collects the return
# values into a new array.

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
