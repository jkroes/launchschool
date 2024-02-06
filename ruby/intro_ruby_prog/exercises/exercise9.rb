#!/usr/bin/env ruby

h = {a:1, b:2, c:3, d:4}
h[:b]
h[:e] = 5
h.select! {|k,v| v>=3.5}
# NOTE This is the canonical answer
# h.delete_if {|k,v| v<3.5}
