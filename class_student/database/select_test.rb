require_relative 'db_connection'

class Student
  def self.all
    result = DBConnection.client.exec('SELECT * FROM students')
    result.each do |row|
      puts "ID: #{row['id']}, Surname: #{row['surname']}, Name: #{row['name']}, Patronymic: #{row['patronymic']}, " \
           "Phone: #{row['phone']}, Telegram: #{row['telegram']}, Email: #{row['email']}, Git: #{row['git']}"
    end
  end
end

# Выполняем SELECT запрос
puts "Список студентов:"
Student.all
