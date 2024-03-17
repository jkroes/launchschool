#!/usr/bin/env ruby

def stringy(int)
  base = '10' * (int / 2)
  int.even? ? base : base + '1'
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Paul Broadfoot had the most interesting solution:
# def stringy(length)
#   [1,0].cycle.take(length).join
# end
