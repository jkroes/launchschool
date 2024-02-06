#!/usr/bin/env ruby

print "How old are you? "
age = gets.chomp.to_i
for i in 1..4
  years = 10*i
  new_age = age+years
  puts "In #{years} years you will be #{new_age}"
end
