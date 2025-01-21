require_relative 'studentShort'
require_relative 'student'
require_relative 'data_list_student_short'
require_relative 'data_list'
require 'json'

class StudentListJSON
  attr_reader :path_to_file

  def initialize(path_to_file)
    @path_to_file = path_to_file
    @students = []
    load_students
  end

  def path_to_file=(new_path)
    raise "Путь к файлу некорректен или файл отсутствует: #{new_path}" unless File.exist?(new_path)

    @path_to_file = new_path
  end

  def load_students
    if File.exist?(@path_to_file)
      file_content = File.read(@path_to_file)
      parsed_data = JSON.parse(file_content, symbolize_names: true)
      @students = parsed_data.map { |data| Student.new(**data) }
    else
      @students = []
    end
  end

  def save_students
    serialized_data = @students.map do |student|
      {
        id: student.id,
        surname: student.surname,
        name: student.name,
        patronymic: student.patronymic,
        phone: student.phone,
        telegram: student.telegram,
        email: student.email,
        git: student.git
      }
    end
    File.open(@path_to_file, 'w') { |file| file.write(JSON.pretty_generate(serialized_data)) }
  end

  def find_student_by_id(id)
    student = @students.find { |stud| stud.id == id }
    raise IndexError, "Студент с таким ID отсутствует" unless student

    student
  end

  def get_k_n_student_short_list(page, items_per_page, existing_list = nil)
    start_index = (page - 1) * items_per_page
    end_index = start_index + items_per_page - 1
    short_list = @students[start_index..end_index] || []
    return existing_list || DataListStudentShort.new([]) if short_list.empty?

    short_list = short_list.map { |stud| StudentShort.from_student(stud) }
    if existing_list
      existing_list.data = short_list
      short_list.each_with_index { |_, idx| existing_list.select(idx) }
      return existing_list
    end

    result_list = DataListStudentShort.new(short_list)
    short_list.each_with_index { |_, idx| result_list.select(idx) }
    result_list
  end

  def sort_students_by_surname
    @students.sort_by!(&:surname)
  end

  def add_new_student(new_student)
    new_student.id = (@students.map(&:id).max || 0) + 1
    @students << new_student
    save_students
    new_student
  end

  def update_student(id, updated_student)
    idx = @students.find_index { |stud| stud.id == id }
    raise "Не найден студент с ID: #{id}" unless idx

    updated_student.id = id
    @students[idx] = updated_student
    save_students
    true
  end

  def remove_student(id)
    @students.reject! { |stud| stud.id == id }
    save_students
  end

  def get_student_count
    @students.count
  end
end
