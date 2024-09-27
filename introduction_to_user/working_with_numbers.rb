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

puts "Введите число:"
number = gets.to_i 
result = summa_of_prime_divisors(number)
odd_digits_count = digits_greater_than_3(number)
puts "Сумма простых делителей числа #{number} равна #{result}."
puts "Количество нечетных цифр, больших 3, в числе #{number} равно #{odd_digits_count}."

