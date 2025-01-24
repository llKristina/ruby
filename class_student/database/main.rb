require_relative 'db_connection'
require_relative 'Student_List_DB'
require_relative 'C:\Users\admin\Documents\GitHub\ruby\class_student\Student.rb'

db = StudentsListDB.new

puts "Количество студентов: #{db.get_student_count}"
puts "Список студентов:"

data_list_student_short = db.get_k_n_student_short_list(1, 5)

students = data_list_student_short.get_data

data_table = DataTable.new(students)
puts data_table.inspect 