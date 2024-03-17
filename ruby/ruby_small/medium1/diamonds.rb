#!/usr/bin/env ruby


def diamond(integer)
  stars = (1..integer).step(2).map { |n| ?* * n }
  stars.each { |stars| puts stars.center(integer) }
  stars.reverse.slice(1..-1).each { |stars| puts stars.center(integer) }
end

# NOTE I think the example solution is worth considering for its clarity
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(9)
