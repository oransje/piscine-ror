#!/usr/bin/ruby

def erehw
  args = ARGV
  return if args.length > 1 or args.length == 0

  capitals_cities = {
    "OR" => "Salem",
    "AL" => "Montgomery",
    "NJ" => "Trenton",
    "CO" => "Denver"
  }

  capital = args[0]
  abbrv = capitals_cities.key capital
  unless abbrv
    p "Unknown capital"
    return
  end

  states = {
    "Oregon"     => "OR",
    "Alabama"    => "AL",
    "New Jersey" => "NJ",
    "Colorado"   => "CO"
  } 
  
  p states.key abbrv
end

erehw