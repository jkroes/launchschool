#!/usr/bin/env ruby

while true
  print "What number should I add to itself? "
  num = gets.chomp
  puts num + num
  print "Type STOP to stop this prompt: "
  input = gets.chomp
  break if input == "STOP"
end
