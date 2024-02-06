#!/usr/bin/env ruby

CREDS = {thisGuy: "secret!"}

loop do
  puts "Please enter your username."
  user = gets.chomp.to_sym
  puts "Please enter the password."
  pw = gets.chomp
  break if pw == CREDS[user]
  puts "Incorrect credentials. Try again."
end

puts "Welcome to the program."
