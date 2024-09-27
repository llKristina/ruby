# Метод для нахождения минимального элемента массива с использованием for
def find_minimum(array)
  return nil if array.empty?  # Проверяем, что массив не пустой
  min_value = array[0]  # Инициализируем минимальное значение первым элементом

  for i in 1...array.size  # Итерируемся по элементам массива
    min_value = array[i] if array[i] < min_value  # Сравниваем и обновляем минимальное значение
  end

  min_value
end

# Метод для нахождения максимального элемента массивf
def find_maximum(array)
  return nil if array.empty?  # Проверяем, что массив не пустой
  max_value = array[0]  # Инициализируем максимальное значение первым элементом

  for i in 1...array.size  # Итерируемся по элементам массива
    max_value = array[i] if array[i] > max_value  # Сравниваем и обновляем максимальное значение
  end

  max_value
end

# Метод для нахождения номера первого положительного элемента
def index_of_first_positive(array)
  for i in 0...array.size  # Итерируемся по элементам массива
    return i if array[i] > 0  # Если нашли положительный элемент, возвращаем его индекс
  end
  -1  # Если положительного элемента нет, возвращаем -1
end

if ARGV.size != 2
  puts "Неверное количество аргументов. Пример использования: ruby program.rb <method> <file>"
  exit
end

method = ARGV[0] # первый аргумент - метод
file_path = ARGV[1] # второй аргумент - путь к файлу

# Чтение данных из файла
if File.exist?(file_path)
  content = File.read(file_path) # читаем содержимое файла как строку
  array = content.split.map(&:to_i) # разделяем строку на части и преобразуем в числа
else
  puts "Файл не найден: #{file_path}" # сообщение, если файл не найден
  exit                             
end

# В зависимости от выбранного метода, вызываем соответствующую функцию
case method
when "min"
  result = find_minimum(array)
  if result.nil?
    puts "Массив пустой!"
  else
    puts "Минимальный элемент: #{result}"
  end
when "max"
result=find_maximum(array)
 if result.nil?
    puts "Массив пустой!"
  else
    puts "Максимальный элемент: #{result}"
  end
when "first_positive"
  result = index_of_first_positive(array)
  if result.nil?
    puts "Положительные элементы отсутствуют!"
  else
    puts "Номер первого положительного элемента: #{result}"
  end
else
  puts "Неверное название метода. Доступные методы: min, max, first_positive"
end