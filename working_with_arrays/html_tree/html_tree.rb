require './tag'

class HtmlTree
  include Enumerable

  attr_accessor :root

  Element_regex = /<(\w+)(.*?)>(.*?)<\/\1>/m

  def initialize(html_content)
    @root = build_tree(html_content)
  end

  def each(&block)
    bfs(&block)
  end

  def dfs(&block)
    return unless root

    stack = [root]
    until stack.empty?
      current = stack.pop
      yield current
      current.children.reverse.each { |child| stack.push(child) }
    end
  end

  def bfs(&block)
    return unless root

    queue = [root]
    until queue.empty?
      current = queue.shift
      yield current
      queue.concat(current.children)
    end
  end

  private

  def build_tree(html_content)
    match = Element_regex.match(html_content)
    return nil unless match

    name = match[1]
    attributes = parse_attributes(match[2])
    inner_content = match[3]

    node = Tag.new(name, attributes)
    extract_children(inner_content).each do |child_content|
      node.children << build_tree(child_content)
    end

    plain_text = inner_content.gsub(Element_regex, '').strip
    node.content = plain_text unless plain_text.empty?

    node
  end

  def extract_children(content)
    content.scan(Element_regex).map do |child|
      "<#{child[0]}#{child[1]}>#{child[2]}</#{child[0]}>"
    end
  end

  def parse_attributes(attribute_string)
    attribute_string.scan(/(\w+)=['"](.*?)['"]/).to_h
  end
end
