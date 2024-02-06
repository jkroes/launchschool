#!/usr/bin/env ruby

movies = { gladiator: 1974,
      the_matrimovies: 1945,
      dune: 2158,
      apocalypse_now: 1929,
      the_shining: 1000
    }

movies.each_value { |i| puts i }
