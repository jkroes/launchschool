#!/usr/bin/env ruby

def print_in_box(msg)
  nfill = msg.size + 2
  line1 = "+#{?- * nfill}+"
  line2 = "|#{?\s * nfill}|"

  puts line1, line2, "| #{msg} |", line2, line1
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
