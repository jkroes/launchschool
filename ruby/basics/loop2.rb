#!/usr/bin/env ruby

# even or odd?

count = 1

loop do
  if count.odd?
    puts "#{count} is odd"
  else
    puts "#{count} is even"
  end
  count += 1
  break if count == 6
end

# catch the number

loop do
  number = rand(100)
  puts number
  break if number >= 0 || number <= 10
end

# conditional loop

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed"
    break
  end
else
  puts "The loop wasn't processed!"
end

# get the sum

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  end

  puts "Wrong answer. Try again!"
end

# insert numbers

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers.append(input)
  break if numbers.size == 5
end

puts numbers

# empty the array

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

# stop counting

5.times do |index|
  puts index
  break if index == 2
end

# only even

number = 0

until number == 10
  number += 1
  puts number if number.even?
end

#  first to five

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a < 5 || number_b < 5
  puts "5 was reached!"
  break
end

# greeting
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
while number_of_greetings > 0
  number_of_greetings -= 1
  greeting
end
