#!/usr/bin/env ruby

def swapcase(string)
  swapped = string.chars.map do |char|
    case char
    when 'A'..'Z' then char.downcase
    when 'a'..'z' then char.upcase
    else char
    end
  end
  swapped.join
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
