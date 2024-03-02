#!/usr/bin/env ruby

def uuid
  hex = [*'a'..'f', *0..9]
  components = Array.new(5) do |index|
    nchar =
      case index
      when 0 then 8
      when 1..3 then 4
      when 4 then 12
      end
    hex.sample(nchar).join
  end
  components.join '-'
end

p uuid
