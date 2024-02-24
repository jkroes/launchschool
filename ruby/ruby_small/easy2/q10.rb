#!/usr/bin/env ruby

def negative(n)
  n.negative? ? n : -n
end

# All test cases should return true
puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby
