#!/usr/bin/env ruby

# NOTE This took me several attempts. Be sure to read the
# question carefully and understand it before attempting a
# solution. Also, my initial instinct to use #map was correct, as
# shown in the commented example solution.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.each_with_object([]) do |(_, details), array|
  if details[:type] == 'fruit'
    array << details[:colors].map {|color| color.capitalize }
  else
    array << details[:size].upcase
  end
end

p result

# hsh.map do |_, value|
#   if value[:type] == 'fruit'
#     value[:colors].map do |color|
#       color.capitalize
#     end
#   elsif value[:type] == 'vegetable'
#     value[:size].upcase
#   end
# end
