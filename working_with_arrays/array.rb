# Дан целочисленный массив. Необходимо найти количество элементов,
# расположенных после последнего максимального.
def count_elements_after_last_max(array)
  max_index = array.rindex(array.max)  # Находим индекс последнего максимального элемента
  count = array.size - max_index - 1   # Количество элементов после последнего максимального
  puts "Количество элементов после последнего максимального: #{count}"
end

#Дан целочисленный массив. Необходимо разместить элементы,
#расположенные до минимального, в конце массива.
def rearrange_array(array)
	min_arr=array.index(array.min)
	result=array[min_arr..-1]+array[0...min_arr]
	puts "Перемещенный массив:  #{result}"
end

#Дан целочисленный массив и интервал a..b. Необходимо найти
#максимальный из элементов в этом интервале.
def find_max(array,a,b)
	if a < 0 || b >= array.size || a > b
		puts "Некорректный интервал."
    return
  end
	max=array[a..b].max
	puts "Максимальный элемент в интервале: #{max}"
end

#Дан целочисленный массив. Вывести индексы элементов, которые
#меньше своего левого соседа, и количество таких чисел.
def less_than_neighbor(array)
	index=[]
	count=0
	(1...array.size).each do |i|
		if array[i]<array[i-1]
			index<<i
			count+=1
		end
	end
puts "Индексы элементов меньше левого соседа: #{index}"
puts "Количество таких элементов: #{count}"
end

#Для введенного списка положительных чисел построить список всех
#положительных простых делителей элементов списка без повторений.
def find_prime_divisors(numbers)
	prime_divisors=[]
	def is_prime?(number)
		return false if number<=1
		(2..Math.sqrt(number)).each do |i|
			return false if number%i==0
		end
		true
	end
	
	numbers.each do |number|
    (2..number).each do |divisor|
      if number % divisor == 0 && is_prime?(divisor) && !prime_divisors.include?(divisor)
        prime_divisors << divisor
      end
    end
  end
  puts "Список всех простых делителей: #{prime_divisors}"
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
	puts "#{count_elements_after_last_max(array)}"
  when 2
    puts "#{rearrange_array(array)}"
  when 3
    puts "Введите начало интервала:"
    a = gets.chomp.to_i
    puts "Введите конец интервала:"
    b = gets.chomp.to_i
    puts "#{find_max(array, a, b)}"
  when 4
    puts "#{less_than_neighbor(array)}"
  when 5
    puts "#{find_prime_divisors(array)}"
  when 6
    puts "Введите массив через пробел (enter для прекращения ввода)"
    array = gets.chomp.split.map(&:to_i)
  else
    puts "Такой функции нет"
  end
end

