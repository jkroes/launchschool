#!/usr/bin/env ruby

p "Enter a number: "
number = gets.chomp.to_i
case
when number >= 0 && number <= 50
  puts "number is between 0 and 50"
when number >= 51 && number <= 100
  puts "number is between 51 and 100"
when number >= 100
  puts "number is greater than 100"
end
