#!/usr/bin/env ruby

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

mult3 = arr.map do |subarr|
  subarr.select do |num|
    num % 3 == 0
  end
end

p mult3
