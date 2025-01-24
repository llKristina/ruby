require_relative 'C:\Users\admin\Documents\GitHub\ruby\class_student\studentShort.rb'
require_relative 'C:\Users\admin\Documents\GitHub\ruby\class_student\data\Data_list_student_short.rb'
require_relative 'student_database'

class StudentsListDB
  def initialize
    @db = DBConnection.instance
  end

  def find_student_by_id(id)
    result = @db.exec_params('SELECT * FROM students WHERE id = $1 LIMIT 1', [id])
    data = result.first
    raise "Студент с ID #{id} не найден" unless data

    build_student(data)
  end

  def get_k_n_student_short_list(k, n)
    offset = (k - 1) * n
    result = @db.exec_params('SELECT * FROM students ORDER BY id LIMIT $1 OFFSET $2', [n, offset])

    short_students = result.map { |row| StudentShort.from_student(build_student(row)) }
	DataListStudentShort.new(short_students)
  end

  def add_student(student)
    result = @db.exec_params(
      'INSERT INTO students (surname, name, patronymic, phone, telegram, email, git)
       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id',
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git]
    )
    student.id = result[0]['id'].to_i
    student
  end

  def update_student_by_id(id, updated_student)
    result = @db.exec_params(
      'UPDATE students SET surname = $1, name = $2, patronymic = $3, phone = $4,
       telegram = $5, email = $6, git = $7 WHERE id = $8',
      [updated_student.surname, updated_student.name, updated_student.patronymic, updated_student.phone,
       updated_student.telegram, updated_student.email, updated_student.git, id]
    )
    raise "Студент с ID #{id} не найден для обновления" if result.cmd_tuples.zero?
    true
  end

  def delete_student_by_id(id)
    result = @db.exec_params('DELETE FROM students WHERE id = $1', [id])
    raise "Студент с ID #{id} не найден для удаления" if result.cmd_tuples.zero?
    true
  end

  def get_student_count
    result = @db.exec_query('SELECT COUNT(*) FROM students')
    result[0]['count'].to_i
  end

  private

  # Преобразовать данные из базы в объект Student
  def build_student(data)
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
end