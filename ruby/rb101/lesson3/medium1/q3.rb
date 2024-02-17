#!/usr/bin/env ruby

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus1: Checks that divisor is a factor of number
# Bonus2: To return factors
