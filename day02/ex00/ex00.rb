#!/usr/bin/ruby

class Html
  attr_reader :page_name

  def initialize(title)
    @page_name = title
    @content = head
  end

  def head
    "<!DOCTYPE html>\n"\
    "<html>\n"\
    "<head><title>#{page_name}</title></head>\n"\
    "<body>\n"
  end

  def dump(lep)
    @content.concat "<p>#{lep}</p>\n"
  end

  def finish
    @content.concat "</body>"

    f = File.new "#{page_name}.html", "w" 
    f.puts @content
    f.close
  end

  private 
  
  attr_writer :content
end