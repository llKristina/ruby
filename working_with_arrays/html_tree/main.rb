require './html_tree'

html_content = <<-HTML
<div class="party-zone">
  <h1>Добро пожаловать на вечеринку!</h1>
  <p class="intro">
    <span>Пожалуйста, принесите</span>
    <span>пиццу и напитки</span>
  </p>
  <h2 class="footer">Танцы до утра!</h2>
</div>
HTML

tree = HtmlTree.new(html_content)

puts "Корень дерева:"
puts tree.root

puts "\nГлубина корня:"
puts tree.root.tag_depth

puts "\nЕсть ли у корня дети?"
puts tree.root.has_children?

puts "\nПервый дочерний элемент корня:"
first_tag = tree.root.children.first
puts first_tag

puts "\nТеги с именем 'span':"
puts tree.select { |tag| tag.name == "span" }
