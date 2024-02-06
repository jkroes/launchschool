#!/usr/bin/env ruby

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

# NOTE chomp is necessary because of the way valid_number? is implemented
int1 = nil
loop do
  puts "Enter an integer:"
  int1 = gets.chomp
  break if valid_number?(int1)
  puts "Input one was not a valid integer."
end

int2 = nil
loop do
  puts "Enter a second integer:"
  int2 = gets.chomp
  break if valid_number?(int2) && !int2.to_i.zero?
  puts "Input two was not a valid nonzero integer."
end

puts "Result: #{int1.to_i / int2.to_i}"
