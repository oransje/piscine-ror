#! /usr/bin/env ruby

class Text
  def initialize(param)
    @content = param
  end

  def to_s
    @content
  end
end

class Elem
  attr_accessor :content, :opt, :tag, :tag_type

  def initialize(tag, content = [], tag_type = "double", opt = {})
    @tag = tag
    @content = content.is_a?(Array) || content.is_a?(Text) ? content : [content]
    @opt = opt
    @tag_type = tag_type
  end

  def add_content(*args)
    args.each { |el| @content << el}
  end

  def to_s
    attributes = @opt.map { |key, value| " #{key}='#{value}'" }.join("")
    open_tag = @tag_type == "simple" ? "<#{@tag}#{attributes} />" : "<#{@tag}#{attributes}>"

    inner_content = @content.is_a?(Text) ? content.to_s : @content.map { |el| 
                                                                      if el.is_a? String
                                                                        el
                                                                      else
                                                                        el.to_s
                                                                      end
                                                                    }.join("")

    close_tag = @tag_type ? "double" ? "</#{@tag}>" : ""
    
    "#{open_tag}#{inner_content}#{close_tag}\n"
  end
end