#!/usr/bin/env ruby

def buy_fruit(groceries)
  groceries.map { |item| [item[0]] * item[1] }.reduce(:+)
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# NOTE The first example solution is a good use case for
# Integer#times.

def buy_fruit(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

# NOTE The second example solution shows how subbarays can be
# destructured within block parameters. Compare its use of
# flatten to my use of reduce(:+) above

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end
