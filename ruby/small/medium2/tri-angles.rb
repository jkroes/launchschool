#!/usr/bin/env ruby

def triangle(*angles)
  if angles.sum != 180 || angles.any?(&:zero?)
    :invalid
  elsif angles.any? { |angle| angle == 90 }
    :right
  elsif angles.any? { |angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end

# NOTE It is more efficient to use #include than #any?, as shown
# in the example solution. This shows how include? is just a
# specialized form of any? combined with equality comparison. I
# should document the relationship between various methods in my
# notes.

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
