#!/usr/bin/env ruby

def factor?(numerator, denominator)
  numerator % denominator == 0
end

def fizzbuzz(start, finish)
  result = (start..finish).map do |int|
    case
    when factor?(int, 15) then "FizzBuzz"
    when factor?(int, 3) then "Fizz"
    when factor?(int, 5) then "Buzz"
    else int
    end
  end
  result.join(', ')
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
