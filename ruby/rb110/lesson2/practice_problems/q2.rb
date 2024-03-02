#!/usr/bin/env ruby

# NOTE The example solution uses sort_by. I purposely use the
# lower-level sort. One hack of the example solution is that it
# does not convert strings to integers, because they are all the
# same length, so the comparison is the same by string or integer
# representation.

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

puts books.sort {|book1, book2| book1[:published].to_i <=> book2[:published].to_i}
