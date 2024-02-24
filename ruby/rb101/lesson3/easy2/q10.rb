#!/usr/bin/env ruby

title = "Flintstone Family Members"
spaces = 40 - title.size
left = spaces / 2
right = spaces - left
" " * left + title + " " * right

# Canonical answer:
title.center(40)
