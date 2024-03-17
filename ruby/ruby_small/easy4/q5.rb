#!/usr/bin/env ruby

def multisum(end_range)
  multiples = (1..end_range).select do |num|
    num % 3 == 0 || num % 5 == 0
  end
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# NOTE Because the range starts at 1, we need to pass a starting
# sum of 0 to reduce. We also need to return sum when our
# conditional fails, so that the next iteration starts from sum.
def multisum2(end_range)
  (1..end_range).reduce(0) do |sum, num|
    rhs = (num % 3 == 0 || num % 5 == 0) ? sum + num : sum
  end
end

p multisum2(3) == 3
p multisum2(5) == 8
p multisum2(10) == 33
p multisum2(1000) == 234168
