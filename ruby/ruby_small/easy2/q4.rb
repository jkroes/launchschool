#!/usr/bin/env ruby

require 'date'

print "What is your age? "
current_age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Date.today.year
num_working_years = retirement_age - current_age
retirement_year = current_year + num_working_years

puts "It's #{current_year}. You will retire in #{retirement_year}."

puts "You have only #{num_working_years} years of work to go!"
