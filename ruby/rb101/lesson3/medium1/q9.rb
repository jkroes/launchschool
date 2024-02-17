#!/usr/bin/env ruby

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)

# bar("yes")
# 'yes' == 'no' ? 'yes' : 'no'
# false ? 'yes' : 'no'
# 'no'
