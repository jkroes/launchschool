#!/usr/bin/env ruby

def cleanup(non_alpha)
  non_alpha.gsub /[^a-zA-Z]+/, " "
end

p cleanup("---what's my +*& line?") == ' what s my line '
