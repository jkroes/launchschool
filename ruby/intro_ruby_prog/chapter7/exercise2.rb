#!/usr/bin/env ruby

# .merge returns a copy of the first hash merged with other hashes. Merging
# implies adding new key-value pairs and replacing the value of a duplicate
# key with the rightmost value. .merge! modifies the original hash.

animals = { cougar: "feline",
            wolf: "feline",
            bluejay: "avian"
          }

puts animals
puts animals.merge({ alligator: "reptile",
                     wolf: "canid"
                   })
puts animals
puts animals.merge!({ alligator: "reptile",
                      wolf: "canid"
                    })
puts animals
