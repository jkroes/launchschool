#!/usr/bin/env ruby

puts 'Enter the first number:'
first = gets.chomp.to_i

puts 'Enter the second number:'
second = gets.chomp.to_i

[:+, :-, :*, :/, :%, :**].each do |op|
  puts "#{first} #{op} #{second} = #{first.send(op, second)}"
end
