#!/usr/bin/env ruby

# runaway loop

loop do
  puts 'Just keep printing...'
  break
end

# loopception

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'

# control the loop

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# loop on command

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase == 'yes'
end

# say hello

say_hello = true
i = 0

while say_hello
  puts 'Hello!'
  i += 1
  if i == 5
    say_hello = false
  end
end

# print while

numbers = []
prng = Random.new

while numbers.length < 5
  num = prng.rand(100)
  numbers.append(num)
end

puts numbers

# count up

count = 1

until count == 11
  puts count
  count += 1
end

# print until

numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers.shift
end

# that's odd

for i in 1..100
  puts i if i % 2 == 1
end

friends = ['Sarah', 'John', 'Hannah', 'Dave']
for name in friends
  puts "Hello, #{name}."
end
