#!/usr/bin/env ruby

def factorial(num)
  total = num
  while num > 1
    num -= 1
    total *= num
  end
  return total
end

factorial 8
factorial 7
factorial 6
factorial 5
