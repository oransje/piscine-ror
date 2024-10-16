#! /usr/bin/env ruby

def croissant
  data = [
    ['Frank', 33],
    ['Stacy', 15],
    ['Juan' , 24],
    ['Dom'  , 32],
    ['Steve', 24],
    ['Jill' , 24]
  ]

  data.sort_by! { |d| [d[1], d[0]]}
  p data
end

croissant