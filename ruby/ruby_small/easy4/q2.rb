#!/usr/bin/env ruby

def century(year)
  number = year.ceil(-2) / 100
  suffix =
    if ('11'..'13').cover? number.to_s[-2..-1]
      'th'
    else
      case number.remainder 10
      when 1 then 'st'
      when 2 then 'nd'
      when 3 then 'rd'
      else 'th'
      end
    end
  "#{number}#{suffix}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
