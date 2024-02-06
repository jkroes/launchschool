#!/usr/bin/env ruby

x = (1..10).to_a.prepend(0)
x.push(11)
x.pop
x.push(3)
x.uniq!
