#! /usr/bin/env ruby

def croissant
  numbers = []
  File.open("./numbers.txt", "r").each { |l| 
    numbers.push l.match(/[0-9]+/).to_s.to_i
  }
  numbers = numbers.sort!
  numbers.each { |n| p n  }
end

croissant