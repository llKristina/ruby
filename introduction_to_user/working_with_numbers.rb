# Проверка, является ли число простым
def prime?(number)
	return false if number < 2
  (2..Math.sqrt(number)).each do |i|
    return false if number % i == 0 
  end
  true 
end

# Функция для нахождения суммы простых делителей числа
def summa_of_prime_divisors(number)
  prime_divisors = []  # Массив для хранения простых делителей
  (1..number).each do |i|
    if number % i == 0 && prime?(i)
      prime_divisors << i  
    end
  end
  prime_divisors.sum
end

# Функция для подсчета нечетных цифр, больших 3
def digits_greater_than_3(number)
  count = 0
  # Преобразуем число в строку и перебираем каждую цифру
  number.to_s.each_char do |char|
    digit = char.to_i  # Преобразуем символ обратно в целое число
    # Проверяем условия: нечетное и больше 3
    if digit.odd? && digit > 3
      count += 1
    end
  end

  count
end

# Функция для нахождения суммы цифр числа
def sum_of_digits(number)
  number.to_s.chars.map(&:to_i).sum  # Преобразуем число в строку, разбиваем на символы и суммируем
end

# Функция для нахождения произведения делителей, сумма цифр которых меньше суммы цифр исходного числа
def product_of_divisors(number)
  digit_sum = sum_of_digits(number)  
  product = 1 
  has_valid_divisor = false  

  (1..number).each do |i|  
    if number % i == 0 && sum_of_digits(i) < digit_sum  # Проверяем, является ли i делителем и его сумма цифр меньше
      product *= i  
      has_valid_divisor = true  # Устанавливаем флаг, что найден хотя бы один корректный делитель
    end
  end

  has_valid_divisor ? product : 0  # Если были найденные делители, возвращаем произведение, иначе 0
end

puts "Введите число:"
number = gets.to_i 
result = summa_of_prime_divisors(number)
odd_digits_count = digits_greater_than_3(number)
product = product_of_divisors(number)
puts "Сумма простых делителей числа #{number} равна #{result}."
puts "Количество нечетных цифр, больших 3, в числе #{number} равно #{odd_digits_count}."
puts "Произведение делителей числа #{number}, сумма цифр которых меньше суммы цифр этого числа, равно #{product}."