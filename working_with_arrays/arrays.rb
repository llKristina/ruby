def count_elements_after_last_max(array)
    max_index = array.rindex(array.max)
    count = array.size - max_index - 1
    count
end

def rearrange_array(array)
    min_arr = array.index(array.min)
    result = array[min_arr..-1] + array[0...min_arr]
    result
end

def find_max(array, a, b)
    return "Некорректный интервал." if a < 0 || b >= array.size || a > b
    max = array[a..b].max
    max
end

def less_than_neighbor(array)
    return { indices: [], count: 0 } if array.size < 2
    indices = (1...array.size).select { |i| array[i] < array[i - 1] }
    count = indices.size
    { indices: indices, count: count }
end

def is_prime?(number)
    return false if number <= 1
    !(2..Math.sqrt(number)).any? { |i| number % i == 0 }
end

def find_prime_divisors(numbers)
    return [] if numbers.empty?
    prime_divisors = numbers.flat_map do |number|
        (2..number).select { |divisor| number % divisor == 0 && is_prime?(divisor) }
    end
    prime_divisors.uniq
end

puts "Введите массив через пробел (enter для прекращения ввода)"
array = gets.chomp.split.map(&:to_i)

loop do
    puts "Введите номер функции (для выхода введите 0):"
    puts "1: Количество элементов после последнего максимального"
    puts "2: Перемещение элементов до минимального в конец массива"
    puts "3: Поиск максимального элемента в интервале"
    puts "4: Вывод индексов элементов меньше левого соседа"
    puts "5: Поиск простых делителей элементов списка"
    puts "6: Изменить массив"

    select_function = gets.chomp.to_i

    break if select_function == 0

    case select_function
    when 1
        result = count_elements_after_last_max(array)
        puts "Количество элементов после последнего максимального: #{result}"
    when 2
        result = rearrange_array(array)
        puts "Перемещенный массив: #{result}"
    when 3
        puts "Введите начало интервала:"
        a = gets.chomp.to_i
        puts "Введите конец интервала:"
        b = gets.chomp.to_i
        result = find_max(array, a, b)
        puts "Максимальный элемент в интервале: #{result}"
    when 4
        result = less_than_neighbor(array)
        puts "Индексы элементов меньше левого соседа: #{result[:indices]}"
        puts "Количество таких элементов: #{result[:count]}"
    when 5
        result = find_prime_divisors(array)
        puts "Список всех простых делителей: #{result}"
    when 6
        puts "Введите массив через пробел (enter для прекращения ввода)"
        array = gets.chomp.split.map(&:to_i)
    else
        puts "Такой функции нет"
    end
end
