#!/usr/bin/env ruby

def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

def running_total2(arr)
  arr.each_with_object([]) do |num, obj|
    obj << (obj.last ? obj.last + num : num)
  end
end

p running_total2([2, 5, 13]) == [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total2([3]) == [3]
p running_total2([]) == []

# NOTE You can pass a collection into reduce. This ends up being
# basically the same code as running_total2.
def running_total3(arr)
  arr.reduce([]) do |arr2, num|
    arr2 << (arr2.last ? arr2.last + num : num)
  end
end
p running_total3([2, 5, 13]) == [2, 7, 20]
p running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total3([3]) == [3]
p running_total3([]) == []
