require_relative 'array_processor'

processor = ArrayProcessor.new([1, 2, 3, 4, 5])

# Тестируем метод any?
puts processor.any? { |x| x > 3 }  
puts processor.any? { |x| x > 10 }

# Тестируем метод find_index
puts processor.find_index { |x| x == 3 }  
puts processor.find_index { |x| x == 10 }  
