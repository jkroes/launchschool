#!/usr/bin/env ruby

# The return value of #reject is a new array [1, 2, 3], because
# puts returns nil, and reject returns a new array with elements
# for which a block returns a falsey value

[1, 2, 3].reject do |num|
  puts num
end
