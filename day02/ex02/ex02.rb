#! /usr/bin/env ruby

class DupFile < StandardError
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
  end

  def show_state
    ap = File.absolute_path("#{@page_name}.html")
    p "file named <#{@page_name}.html> was already there: #{@path}"
  end

  def correct
    new_name = "#{@page_name}.new"
    begin 
      raise error = ::DupFile.new(new_name) if File.file? "#{new_name}.html"
    rescue => error
      error.correct
    end

    File.open "#{new_name}.html", "w+"
  end

  def explain
    ap = File.absolute_path("#{@page_name}.html")
    p "Appended .new in order to create requested file: #{ap}.new.html"
  end
end

class BodyClosed
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
  end

  def show_state
    p "In <#{page_name}.html> body was closed :"
  end

  def correct
    path = "#{@page_name}.html"
    new_lines = []
    body_closed_tag = "</body>"
    @nb = 0

    File.foreach path do |l|
      new_lines << l unless l.include? "</body>"
    end

    p new_lines

    File.open path, "w" do |f, i|
      new_lines.each { |l| f.puts l}
      @nb = @nb+1
    end

    File.open path, "a+" do |f| 
      f.puts body_closed_tag 
    end
  end

  def explain
    p "> ln :#{@nb} </body> : text has been inserted and tag moved at the end of it"
  end

end