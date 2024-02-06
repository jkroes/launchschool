#!/usr/bin/env ruby

def to_zero(num)
  puts num
  return num if num <= 0
  to_zero(num-1)
end

to_zero(10)
to_zero(-0)
to_zero(-1)
