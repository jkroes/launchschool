#!/usr/bin/env ruby

ordinals = ['1st', '2nd', '3rd', '4th', '5th', '6th']
numbers = ordinals.map do |ord|
  puts "==> Enter the #{ord} number:"
  gets.chomp.to_i
end

first = numbers[0..-2]
last = numbers[-1]
if first.include? last
  puts "The number #{last} appears in #{first}."
else
  puts "The number #{last} does not appear in #{first}."
end
