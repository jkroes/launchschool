#!/usr/bin/env ruby

def factors(number, limit)
  result = []
  1.upto(limit) do |n|
    result << n if number % n == 0
  end
  result
end

# The first toggle turns a light on, the second off, the third on, ...
# Therefore, an odd number of toggles turns a light on

# There are as many rounds as lights

# The first round toggles lights that are multiples of 1, the
# second round multiples of 2, ...

# Therefore, we can check the number of factors of a light
# between 1 and the number of rounds/lights
def toggle_lights(num_lights)
  [*1..num_lights].select { |light| factors(light, num_lights).size.odd? }
end

p toggle_lights(1000) ==
  [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
