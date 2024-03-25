#!/usr/bin/env ruby

# input: array of numbers
# return: the number that occurs only once
# rules: there are two unique values in the array, which is
# always length 3 or greater
# algorithm:
# iterate over unique values
# delete each value from array
# return the value if the size of the array is > 1

def what_is_different(numbers)
  numbers.uniq.each do |n|
    return n if numbers.count(n) == 1
    # Matches algorithm above:
    ## copy = numbers.dup
    ## copy.delete(n)
    ## return n unless copy.size == 1
  end
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3
