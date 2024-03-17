#!/usr/bin/env ruby

def count_occurrences(array)
  counts = Hash.new(0)
  array.reduce(counts) do |hsh, elem|
    hsh[elem] += 1
    hsh
  end
  counts.each do |elem, count|
    puts "#{elem} => #{count}"
  end
end

# NOTE The #tally method, which returns a hash with array
# elements as keys and their count as values
# Further exploration: case insensitive keys

def count_occurrences(array)
  array.map(&:downcase).tally.each do |elem, count|
    puts "#{elem} => #{count}"
  end
end

# In the further exploration, the tally solution above is the
# simplest.
def count_occurrences(array)
  array2 = array.map(&:downcase)
  array2.uniq.each do |elem|
    puts "#{elem} => #{array2.count(elem)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)
