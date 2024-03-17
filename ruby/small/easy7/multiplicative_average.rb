#!/usr/bin/env ruby

def show_multiplicative_average(array)
  format("The result is %.3f", array.reduce(:*) / array.size.to_f)
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Further exploration
# Omiting #to_f results in integer division, which rounds toward
# negative infinity
