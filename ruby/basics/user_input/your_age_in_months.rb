#!/usr/bin/env ruby

print "Enter your age in years: "
# NOTE chomp is also unnecessary; to_i strips it before conversion.
years = gets.chomp.to_i
puts years * 12
