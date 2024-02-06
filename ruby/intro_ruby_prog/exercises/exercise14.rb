#!/usr/bin/env ruby

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map{ |words| words.split }.flatten
