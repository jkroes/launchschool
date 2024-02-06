#!/usr/bin/env ruby

# print "Do you want to print something? (y/n) "
# loop do
#   input = gets.chomp.downcase
#   if input == "y"
#     puts "something"
#     break
#   elsif input == "n"
#     break
#   end
#   print "Please enter a valid value (y/n) "
# end

# NOTE The solution for this is interesting. Notice the syntax for constructing
# an array, the use of puts outside the loop, and the fact that choice must be
# initialized outside of the loop to use choice later.
choice = nil
loop do
  puts '>> Do you want me to print something? (y/n)'
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)
  puts '>> Invalid input! Please enter y or n'
end
puts 'something' if choice == 'y'
