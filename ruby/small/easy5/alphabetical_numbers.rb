#!/usr/bin/env ruby

NUMBERS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six',
          'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve',
          'thirteen', 'fourteen', 'fifteen', 'sixteen',
          'seventeen', 'eighteen', 'nineteen']

def alphabetic_number_sort(numbers)
  numbers.sort_by { |num| NUMBERS[num] }
end

# Further exploration

# Technically, we don't need the call to #to_a unless we use
# sort_by!, which is only defined for an array. And the argument
# used in the test case isn't a variable, so we couldn't observe
# mutation anyway.

def alphabetic_number_sort(numbers)
  numbers.sort { |num1, num2| NUMBERS[num1] <=> NUMBERS[num2] }
end

p (alphabetic_number_sort((0..19).to_a) == [
     8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
     6, 16, 10, 13, 3, 12, 2, 0
   ])
