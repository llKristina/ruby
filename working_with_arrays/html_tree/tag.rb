class Tag
  attr_accessor :name, :attributes, :content, :children

  def initialize(name, attributes = {}, content = "")
    @name = name
    @attributes = attributes
    @content = content
    @children = []
  end

  def tag_name_as_string
    "Tag name: #{@name}"
  end

  def number_of_children
    @children.size
  end

  def has_children?
    !@children.empty?
  end

  def tag_depth(current_depth = 1)
    return current_depth if children.empty?

    children.map { |child| child.tag_depth(current_depth + 1) }.max
  end

  def to_s
      attributes_string = attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
      start_tag = attributes_string.empty? ? "<#{name}>" : "<#{name} #{attributes_string}>"
      end_tag = "</#{name}>"
    
      "#{start_tag}#{content}#{end_tag}\n"
	  
  end
end
