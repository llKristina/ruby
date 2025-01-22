require_relative 'db_connection'
require_relative '"C:\Users\admin\Documents\GitHub\ruby\class_student\data\student.rb"'

class StudentDatabase
  def initialize
    @db = DBConnection.client
  end
  
  def find_by_id(id)
    result = @db.exec_params('SELECT * FROM students WHERE id = $1 LIMIT 1', [id])
    result.first
  end

  def get_students(limit, offset)
    @db.exec_params('SELECT * FROM students ORDER BY id LIMIT $1 OFFSET $2', [limit, offset])
  end

  def insert_student(student)
    @db.exec_params(
      'INSERT INTO students (surname, name, patronymic, phone, telegram, email, git)
       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id',
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git]
    )
  end


  def update_student(id, student)
    @db.exec_params(
      'UPDATE students SET surname = $1, name = $2, patronymic = $3, phone = $4,
       telegram = $5, email = $6, git = $7 WHERE id = $8',
      [student.surname, student.name, student.patronymic, student.phone, student.telegram, student.email, student.git, id]
    )

  def delete_student(id)
    @db.exec_params('DELETE FROM students WHERE id = $1', [id])
  end

  def count_students
    result = @db.exec('SELECT COUNT(*) FROM students')
    result[0]['count'].to_i
  end
end
