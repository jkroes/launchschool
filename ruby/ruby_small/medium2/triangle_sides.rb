#!/usr/bin/env ruby

# NOTE I commented out my original snippet for finding an
# invalid triangle in favor of the example solution's. I need to
# learn to translate "the sum of the lengths of the two shortest
# sides must be greater than the length of the longest side" to
# "the sum of the sides must be greater than twice the length of
# the longest side."

def triangle(*sides)
  counts = sides.tally.values

  # sides.sort!
  # if sides[0..1].sum <= sides[2] || sides.any?(&:zero?)
  if 2 * sides.max >= sides.sum || sides.any?(&:zero?)
    :invalid
  elsif counts.size == 1
    :equilateral
  elsif counts.size == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

sides = [3, 3, 1.5]
sides.any? { |side| (sides - [side]).include?(side) }
