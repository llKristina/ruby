require_relative 'db_connection'
require_relative 'C:\Users\admin\Documents\GitHub\ruby\class_student\studentShort.rb'
require_relative 'C:\Users\admin\Documents\GitHub\ruby\class_student\data\Data_list_student_short.rb'
require_relative 'student_database'

class StudentsListDB
  def initialize
    @db = StudentDatabase.new
  end

  def find_student_by_id(id)
    data = @db.find_by_id(id)
    raise "Студент с ID #{id} не найден" unless data

    Student.new(
      id: data['id'].to_i,
      surname: data['surname'],
      name: data['name'],
      patronymic: data['patronymic'],
      phone: data['phone'],
      telegram: data['telegram'],
      email: data['email'],
      git: data['git']
    )
  end

  def get_k_n_student_short_list(k, n)
    offset = (k - 1) * n
    result = @db.get_students(n, offset)
    short_students = result.map do |row|
      StudentShort.from_student(
        Student.new(
          id: row['id'].to_i,
          surname: row['surname'],
          name: row['name'],
          patronymic: row['patronymic'],
          phone: row['phone'],
          telegram: row['telegram'],
          email: row['email'],
          git: row['git']
        )
      )
    end

   data_list = DataListStudentShort.new(short_students)
   
  (0..n-1).each { |index| data_list.select(index) }

  data_list
end

  def add_student(student)
    result = @db.insert_student(student)
    student.id = result[0]['id'].to_i
    student
  end

  def update_student_by_id(id, updated_student)
    result = @db.update_student(id, updated_student)
    raise "Студент с ID #{id} не найден для обновления" if result.cmd_tuples.zero?

    true
  end

  def delete_student_by_id(id)
    result = @db.delete_student(id)
    raise "Студент с ID #{id} не найден для удаления" if result.cmd_tuples.zero?

    true
  end

  def get_student_count
    @db.count_students
  end
end
