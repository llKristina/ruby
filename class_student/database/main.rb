require_relative 'student_list_DB'
require_relative 'C:\Users\admin\Documents\GitHub\ruby\class_student\Student.rb'

db = StudentsListDB.new

puts "Количество студентов: #{db.get_student_count}"

new_student = Student.new(
  id: 10,
  surname: 'Sidorov',
  name: 'Ivan',
  patronymic: 'Petrovich',
  phone: '1234567890',
  telegram: '@sidorov',
  email: 'sidorov@example.com',
  git: 'github.com/sidorov'
)
added_student = db.add_student(new_student)
puts "Добавлен студент с ID #{added_student.id}"

puts "Список студентов:"
puts db.get_k_n_student_short_list(1, 5).get_data.inspect
