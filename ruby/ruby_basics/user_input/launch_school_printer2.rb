#!/usr/bin/env ruby

# NOTE I had a different interpretation of the question than the official solution

loop do
  number_of_lines = nil
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3:'
    number_of_lines = gets.to_i
    break if number_of_lines >= 3
    puts ">> That's not enough lines."
  end

  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end

  puts "Type q to quit"
  quit = gets.chomp
  break if quit.downcase == "q"
end
