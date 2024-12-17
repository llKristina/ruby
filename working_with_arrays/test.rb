require_relative 'array_processor'

processor = ArrayProcessor.new([1, 2, 3, 4, 5])

# Тестируем метод any?
puts processor.any? { |x| x > 3 }  
puts processor.any? { |x| x > 10 }

# Тестируем метод find_index
puts processor.find_index { |x| x == 3 }  
puts processor.find_index { |x| x == 10 }  

# Тестируем метод none?
puts processor.none? { |x| x < 0 }  
puts processor.none? { |x| x == 4 } 

# Тестируем метод reduce
puts processor.reduce { |sum, x| sum + x } 
puts processor.reduce(10) { |sum, x| sum + x } 

# Тестируем метод min_max
puts processor.min_max.inspect

# Тестируем метод find_all
puts processor.find_all { |x| x.even? }.inspect 