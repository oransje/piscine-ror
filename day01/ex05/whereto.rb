#!/usr/bin/ruby

def whereto
  args = ARGV
  return if args.length > 1 or args.length == 0
  info = args[0].split(",").each {|s| s.strip!}.reject{|s| s.empty?}

  capitals_cities = {
    "OR" => "Salem",
    "AL" => "Montgomery",
    "NJ" => "Trenton",
    "CO" => "Denver"
  }
  states = {
    "Oregon"     => "OR",
    "Alabama"    => "AL",
    "New Jersey" => "NJ",
    "Colorado"   => "CO"
  } 

  process_info(info, capitals_cities, states)
end

def is_capital?(capitals_cities, capital)
  return capital if capitals_cities.key capital
end

def is_state?(info, states)
  states[info]
end

def process_info(info, capitals_cities, states)
  i = info.each do |s|
    s.capitalize!

    st = is_state?(s, states)
    cp = is_capital?(capitals_cities, s)
  
    if cp 
      abbrv = capitals_cities.key cp
      p "#{cp} is the capital of #{states.key abbrv} (akr: #{abbrv})"
    elsif st
      cp = capitals_cities[st]
      abbrv = capitals_cities.key cp
      p "#{cp} is the capital of #{states.key abbrv} (akr: #{abbrv})"
    else
      s.downcase!
      p "#{s} is neither a capital city nor a state"
    end
  end
end

whereto