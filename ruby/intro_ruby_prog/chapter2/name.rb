#!/usr/bin/env ruby

print "Enter your first name: "
first_name = gets.chomp
print "Enter your last name: "
last_name = gets.chomp
name = first_name + " " + last_name
puts "Welcome #{name}"

10.times do
  puts name
end
