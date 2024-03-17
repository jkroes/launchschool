#!/usr/bin/env ruby


def sum_square_difference(integer)
  range = 1..integer
  range.sum ** 2 - range.map { |i| i**2 }.sum
end

# NOTE I took the easy way of doing things. The example solution
# accesses each element only once by doing two operations on two
# totals

def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
