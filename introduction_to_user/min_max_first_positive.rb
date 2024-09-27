# Метод для нахождения минимального элемента массива с использованием for
def find_minimum(array)
  return nil if array.empty?  # Проверяем, что массив не пустой
  min_value = array[0]  # Инициализируем минимальное значение первым элементом

  for i in 1...array.size  # Итерируемся по элементам массива
    min_value = array[i] if array[i] < min_value  # Сравниваем и обновляем минимальное значение
  end

  min_value
end

# Метод для нахождения максимального элемента массива с использованием for
def find_maximum(array)
  return nil if array.empty?  # Проверяем, что массив не пустой
  max_value = array[0]  # Инициализируем максимальное значение первым элементом

  for i in 1...array.size  # Итерируемся по элементам массива
    max_value = array[i] if array[i] > max_value  # Сравниваем и обновляем максимальное значение
  end

  max_value
end

array = [-3, 4, -2, 0, 1, -5, 7, -9]

# Нахождение минимального элемента
min_value = find_minimum(array)
puts "Минимальный элемент: #{min_value}"

# Нахождение максимального элемента
max_value = find_maximum(array)
puts "Максимальный элемент: #{max_value}"

