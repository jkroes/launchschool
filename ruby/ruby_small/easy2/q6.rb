#!/usr/bin/env ruby

puts (1..99).step(2).to_a

1.upto(99) {|n| puts n if n.odd?}
