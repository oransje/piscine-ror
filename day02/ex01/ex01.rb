#! /usr/bin/env ruby

class Html
  attr_reader :page_name

  def initialize(title)
    @page_name = title
    @content = head
    @file = File.new "#{@page_name}.html", "w+" 
  end

  def head
    raise "<#{@page_name}.html> already exist!" if page_exists?
    "<!DOCTYPE html>\n"\
    "<html>\n"\
    "<head><title>#{page_name}</title></head>\n"\
    "<body>\n"
  end

  def dump(lep)
    @content.concat "<p>#{lep}</p>\n"
  end

  def finish
    raise "<#{@page_name}.html> was already closed!" if page_closed?
    @content.concat "</body>"

    @file.close
  end

  private 
  
  attr_writer :content
  attr_writer :file

  def page_exists?
    File.file?("#{@page_name}.html")
  end

  def page_closed?
    @file.closed?
  end
end
