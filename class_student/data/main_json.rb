require_relative 'student_list'
require_relative 'student_list_json'
require_relative 'student_list_yaml'

 # прочитать из json в yaml
filepath1 = 'student.json'
strategy1 = StudentListJSON.new
students_list = StudentList.new(filepath1,strategy1)
students_list.load_students

filepath2 = 'student.yaml'
strategy2 = StudentListYAML.new
students_list_yaml = StudentList.new(filepath2, strategy2)
students_list_yaml.send(:students=, students_list.get_students)
students_list_yaml.save_students
puts "Студенты записаны в YAML: #{filepath2}"

