#!/usr/bin/env ruby

# NOTE The official solution is interesting in that it embeds a loop in a
# method and uses return instead of break. You don't need both; apparently it
# is enough to exit a loop if you exit a containing method.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

int1 = nil
loop do
  print "Enter an integer: "
  int1 = gets.chomp
  break if valid_number?(int1)
  puts "Invalid integer. Try again."
end

int2 = nil
loop do
  sign = int1.to_i.positive? ? "negative" : "positive"
  print "Enter a #{sign} integer: "
  int2 = gets.chomp
  break if valid_number?(int2) && (int1.to_i * int2.to_i).negative?
  puts "Invalid response. Try again."
end

puts "Sum: #{int1.to_i + int2.to_i}"
