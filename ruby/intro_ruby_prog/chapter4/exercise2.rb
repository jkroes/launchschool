#!/usr/bin/env ruby

def upcase10(str)
  if str.length > 10
    str.upcase
  else
    str
  end
end

upcase10("hello there")
upcase10("smaller")
