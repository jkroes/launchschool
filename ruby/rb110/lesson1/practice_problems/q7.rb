#!/usr/bin/env ruby

# The block returns a boolean that indicates whether a number is
# odd. any? returns true, because at least one number is odd. The
# code outputs 1.

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
