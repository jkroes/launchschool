#!/usr/bin/env ruby

def featured?(number)
  number.odd? &&
    number % 7 == 0 &&
    number.digits.tally.values.all? { |count| count == 1 }
end

def featured(number)
  # A number can only have unique digits if it is 10 digits or less
  # (each digit can be 0-9). Also, using while instead of loop
  # allows us to move the raise statement outside of the loop,
  # which saves a second according to my tests.
  while number < 10**10
    # Remember that we are returning the next featured number, so
    # the input must be nicremented right away.
    number += 1
    break if featured? number
  end
  raise "There is no possible number that fulfills those requirements" if number == 10**10
  number
end

# NOTE The example solution cuts run time almost in half by
# incrementing by 14. If we add seven to an odd number, the
# result is even, so instead we add 14 to create another odd
# number. This eliminates the need for a separate featured?
# method. The limit used is 987654321 instead of 10,000,000,000.
# A return statement is used when a featured number is found,
# while break is used to exit the loop and "raise" an "error"
# message. Finally, this solution converts the number to an array
# of chars and checks whether it contains as many unique
# character as characters. This is a simpler solution than my use
# of tally and all?.

def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

starting = Time.now
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
ending = Time.now
p "Elapsed time: #{ending - starting}"
p featured(9_999_999_999)
