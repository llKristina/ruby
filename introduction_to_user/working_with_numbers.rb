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

puts "Введите число:"
number = gets.to_i 
result = summa_of_prime_divisors(number)
puts "Сумма простых делителей числа #{number} равна #{result}."
