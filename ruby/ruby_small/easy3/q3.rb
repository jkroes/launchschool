#!/usr/bin/env ruby

puts "Please write word or multiple words: "
input = gets.chomp
tokens = input.split ?\s
nchars = tokens.join.size
puts "There are #{nchars} characters in #{input}."
