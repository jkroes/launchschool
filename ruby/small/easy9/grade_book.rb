#!/usr/bin/env ruby

def get_grade(*scores)
  case scores.sum / scores.size
  when 90..    then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(100, 100, 105) == "A"
