#!/usr/bin/env ruby

# 8:13
# 8:28

# Problem:
# Create a method
# - Input: array of integers
# - Return: minimum integer that can be added to the integers in
# the array such that the sum equals the next prime number
# greater than the sum of the original array
# Requirements:
# - The return value cannot be zero / if the array numbers sum to
# a prime, find the next prime
# - array size >= 2

# Algorithm:
# Find the next prime
# - Sum the original array
# - Iterate from the sum to infinity until a prime is found
#   - If number is even, not prime
#   - Otherwise, if number has any factors other than 1 and
#     itself, not prime
# Return prime - sum

def prime?(n)
  return false if n.even?
  (3..Integer.sqrt(n)).step(2) do |divisor|
    return false if n % divisor == 0
  end
  true
end

def nearest_prime_sum(integers)
  sum = integers.sum
  current = sum
  loop do
    current += 1
    break if prime? current
  end
  current - sum
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
