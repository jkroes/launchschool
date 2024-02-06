#!/usr/bin/env ruby

stoplight = ['green', 'yellow', 'red'].sample
message = case stoplight
when 'green' then 'Go!'
when 'yellow' then 'Slow down!'
when 'red' then 'Stop!'
end
puts message
