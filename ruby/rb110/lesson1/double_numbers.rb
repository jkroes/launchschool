#!/usr/bin/env ruby

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  numbers.replace(doubled_numbers)
end

def double_numbers2(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] *= 2
    counter += 1
  end
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)
puts my_numbers == [2, 8, 6, 14, 4, 12]
double_numbers2(my_numbers)
puts my_numbers == ([2, 8, 6, 14, 4, 12].map {|num| num * 2})
