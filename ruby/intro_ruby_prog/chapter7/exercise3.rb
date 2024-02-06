#!/usr/bin/env ruby

{ a: 1, b: 2, c:3 }.each_key do | k |
  puts k
end

{ a: 1, b: 2, c:3 }.each_value do | v |
  puts v
end


{ a: 1, b: 2, c:3 }.each do | k, v |
  puts "#{k}: #{v}"
end
