#!/usr/bin/env ruby

def fibonacci(number)
  count = 0
  numbers = []
  until count == number
    if count < 2
      numbers << 1
    else
      numbers << numbers[-1] + numbers[-2]
      numbers.shift
    end
    count += 1
  end
  p numbers
  numbers.last
end

# NOTE The example solution is what I should be aiming for here.

def fibonacci(nth)
  first, last = 1, 1
  3.upto(nth) do
    first, last = last, first + last
  end

  last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
large_num = fibonacci(100_001).to_s
p large_num[-19..-1] == "8285979669707537501"
