#! /usr/bin/env ruby

def where
  args = ARGV
  return if args.length > 1 or args.length == 0

  states = {
    "Oregon"     => "OR",
    "Alabama"    => "AL",
    "New Jersey" => "NJ",
    "Colorado"   => "CO"
  } 

  state = args[0]
  unless states.include?(state)
    p "Unknown state"
    return
  end

  capitals_cities = {
    "OR" => "Salem",
    "AL" => "Montgomery",
    "NJ" => "Trenton",
    "CO" => "Denver"
  }
  abbrv = states[state]

  p "#{states[state]} : #{capitals_cities[abbrv]}"
end

where