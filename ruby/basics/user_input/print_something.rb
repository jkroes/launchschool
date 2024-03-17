#!/usr/bin/env ruby

puts "Do you want to print something? (y/n)"
# NOTE chomp is necessary because of the comparison
input = gets.chomp
puts "something" if input.downcase == "y"
