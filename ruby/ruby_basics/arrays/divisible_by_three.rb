#!/usr/bin/env ruby

numbers = [5, 9, 21, 26, 39]
numbers.select do |number|
  number % 3 == 0
end
