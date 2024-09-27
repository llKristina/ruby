# Метод для нахождения минимального элемента массива с использованием for
def find_minimum(array)
  return nil if array.empty?  # Проверяем, что массив не пустой
  min_value = array[0]  # Инициализируем минимальное значение первым элементом

  for i in 1...array.size  # Итерируемся по элементам массива
    min_value = array[i] if array[i] < min_value  # Сравниваем и обновляем минимальное значение
  end

  min_value
end

array = [-3, 4, -2, 0, 1, -5, 7, -9]

# Нахождение минимального элемента
min_value = find_minimum(array)
puts "Минимальный элемент: #{min_value}"

