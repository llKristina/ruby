require_relative 'student'

# Создание объекта Student с обязательными полями
student = Student.new('Иванов', 'Иван', 'Иванович')

# Установка дополнительных полей
student.id = 1
student.phone = '+7-999-123-45-67'
student.telegram = '@ivanov'
student.email = 'ivanov@example.com'
student.git = 'github.com/ivanov'

# Вывод информации о студенте
puts "ID: #{student.id}"
puts "Фамилия: #{student.surname}"
puts "Имя: #{student.name}"
puts "Отчество: #{student.patronymic}"
puts "Телефон: #{student.phone}"
puts "Телеграм: #{student.telegram}"
puts "Почта: #{student.email}"
puts "Git: #{student.git}"
