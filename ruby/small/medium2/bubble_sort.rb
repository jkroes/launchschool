#!/usr/bin/env ruby

def bubble_sort!(array)
  n = 0
  loop do
    swapped = false
    (array.size - 1).times do |i|
      v1, v2 = array[i], array[i+1]
      if v1 > v2
        array[i], array[i+1] = v2, v1
        swapped = true
      end
    end
    break unless swapped
  end
end

# NOTE The example solution inverts the conditional and uses
# next. It also iterates from 1 to array.size-1 instead of 0 to
# array.size-2.

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

# Further exploration: Implements the first optimization on
# https://en.wikipedia.org/wiki/Bubble_sort. Notice how on each
# iteration of the outer loop, the largest unsorted element is
# sorted to its final place in the loop. Thus, on the next
# iteration, we no longer have to compare with that element.

def bubble_sort!(array)
  n = array.size - 1
  loop do
    # p "#{n}: #{array}"
    swapped = false
    n.times do |i|
      v1, v2 = array[i], array[i+1]
      # p "#{v1}, #{v2}"
      next if v1 <= v2
      array[i], array[i+1] = v2, v1
      swapped = true
    end
    n = n - 1
    break unless swapped
  end
end

# Further exploration: Implements the second optimization

def bubble_sort!(array)
  n = array.size - 1
  loop do
    # p "#{n}: #{array}"
    swapped = 0
    n.times do |i|
      v1, v2 = array[i], array[i+1]
      # p "#{i}: #{v1} <= #{v2}"
      next if v1 <= v2
      array[i], array[i+1] = v2, v1
      swapped = i
    end
    n = swapped
    break if swapped == 0
  end
end

w = [2, 0, -1, 2, 1]
x = [6, 2, 7, 1, 4]
y = [10, 8, 9, 7, 5, 6, 4, 3, 1, 2 ]
z = [4, 3, 11, 103, 2, 99, 0]
bubble_sort!(w)
p w
bubble_sort!(x)
p x
bubble_sort!(y)
p y
bubble_sort!(z)
p z
