#!/usr/bin/ruby

def mes_variables
  a = 10
  b = "10"
  c = nil
  d = 10.0

  puts "mes variables :"
  puts "\ta contient: #{a} et est de type: #{a.class}"
  puts "\tb contient: #{b} et est de type: #{b.class}"
  puts "\tc contient: #{c.inspect} et est de type: #{c.class}"
  puts "\td contient: #{d} et est de type: #{d.class}"
end

mes_variables
