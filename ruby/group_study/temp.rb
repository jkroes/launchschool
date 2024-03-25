#!/usr/bin/env ruby

def common_chars(strings)
  result = []
  strings[0].chars.each do |char|
    if strings.all? { |string| string.include? char }
      next if result.include? char
      common_count = strings.map { |string| string.count char }.min
      common_count.times { |_| result << char }
    end
  end
  result
end

p common_chars(['bella', 'label', 'roller'])
