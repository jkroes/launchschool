#!/usr/bin/env ruby

def double_num(num)
  num * 2
end

def double_evens(arr)
  arr.map do |num|
    binding.irb
    new_num = (puts num) || (num.even? ? double_num(num) : num)
  end
end

double_evens [*1..5]
