#!/usr/bin/env ruby

# NOTE My solution is somewhat more malicious than the official solution
puts "How many output lines do you want? Enter a number >=3:"
nlines = [gets.to_i, 3].max
until nlines == 0
  puts "Launch School is the best!"
  nlines -= 1
end
