#!/usr/bin/env ruby

arr = [1, 3, 5, 7, 9, 11]
number = 3
if arr.include?(number)
  puts "#{arr} includes #{number}"
else
  puts "#{arr} does not include #{number}"
end
