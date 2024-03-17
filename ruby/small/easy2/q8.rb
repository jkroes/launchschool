#!/usr/bin/env ruby

puts "Please enter an integer greater than 0:"
int = gets.chomp.to_i
if int == 0
  puts "Must enter a nonzero integer"
  exit
end

puts "Enter 's' to compute the sum, 'p' to compute the product."
op = gets.chomp

if op == 's'
  op = :+
  opdesc = 'sum'
elsif op == 'p'
  op = :*
  opdesc = 'product'
else
  puts 'Unknown operation.'
  exit
end

result = (1..int).reduce(op)

puts "The #{opdesc} of the integers between 1 and #{int} is #{result}."
