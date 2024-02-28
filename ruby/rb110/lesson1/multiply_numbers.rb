#!/usr/bin/env ruby

def multiply_numbers(numbers, rhs)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * rhs

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply_numbers(my_numbers, 3) == (my_numbers.map {|num| num * 3})
