#!/usr/bin/env ruby

stoplight = ['green', 'yellow', 'red'].sample
if stoplight == 'green' then puts 'Go!'
elsif stoplight == 'yellow' then puts 'Slow down!'
else puts 'Stop!'
end
