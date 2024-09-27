puts "Hello,World!"
name=ARGV[0]
puts "Привет, #{name}"
puts "Какой твой любимый язык программирования?"
favLang=STDIN.gets.chomp.downcase
if favLang == "ruby"
  puts "Подлиза!"
else
  puts "Скоро будет Ruby :)"
end
case favLang.downcase
when "python" 
puts "Замечательный выбор!"
when "c++" 
puts "Круть))"
when "c#" 
puts "Здорово!!!"
end
puts "Введите команду языка Ruby:"
eval(STDIN.gets.chomp)
puts "Введите команду операционной системы:"
system(STDIN.gets.chomp)