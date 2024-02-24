#!/usr/bin/env ruby

def multiply(a, b)
  a * b
end

def square(a)
  multiply(a, a)
end

puts square(-8)

# Further exploration

def power(a, n)
  nums = [a] * n
  product = 1
  while nums.size > 0
    product *= nums.pop
  end
  product
end

puts power 4, 3
