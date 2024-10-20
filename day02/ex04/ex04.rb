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
    check_for_content_tags = %w[Html Head Body].include?(@tag) ?  "<#{@tag}#{attributes}>\n" : "<#{@tag}#{attributes}>"
    open_tag = @tag_type == "simple" ? "<#{@tag}#{attributes} />" : check_for_content_tags

    inner_content = @content.is_a?(Text) ? content.to_s : @content.map { |el| 
                                                                          if el.is_a? String
                                                                            el
                                                                          else
                                                                            el.to_s
                                                                          end
                                                                        }.join("")

    close_tag = @tag_type == "double" ? "</#{@tag}>\n" : "\n"
    
    "#{open_tag}#{inner_content}#{close_tag}"
  end
end

tags = %w[Html Head Body Title Meta Img Table Th Tr Td Ul Ol Lo H1 H2 P Div Span Hr Br]

tags.each { |tag|
  Object.const_set(tag, Class.new(Elem) { 
    define_method(:initialize) { |content = [], opt = {}|
      tag_type = %w[Br Img Meta Hr].include?(tag) ? "simple" : "double"
      super(tag, content, tag_type, opt)
    }
  })
}

puts Html.new([Head.new([Title.new("Hello ground!")]), Body.new([H1.new("Oh no, not again!"),  Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ]).to_s