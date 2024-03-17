#!/usr/bin/env ruby

PW = "secret!"
puts "Please enter the password."
loop do
  attempt = gets.chomp
  break if attempt == PW
  puts "Incorrect password. Try again."
end

puts "Welcome to the program."
