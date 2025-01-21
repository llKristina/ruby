require_relative 'studentShort'
require_relative 'student'
require_relative 'data_list_student_short'

class StudentList
  attr_reader :path_to_file

  def initialize(path_to_file, strategy)
    @path_to_file = path_to_file
	@strategy = strategy
	@students = load_students
    load_students
  end

  def path_to_file=(new_path)
    raise "Путь к файлу некорректен или файл отсутствует: #{new_path}" unless File.exist?(new_path)

    @path_to_file = new_path
  end

  def load_students
	 @strategy.read(@path_to_file).map {|data| Student.new(**data)}
  end

  def save_students
		@strategy.write(@path_to_file, @students)
  end

  def find_student_by_id(id)
    student = @students.find { |student| StudentShort.from_student(student) }
raise IndexError, "Студент с таким ID отсутствует" unless student

    raise IndexError, "Студент с таким ID отсутствует" unless student

    student
  end

  def get_k_n_student_short_list(page, items_per_page, existing_list = nil)
    start_index = (page - 1) * items_per_page
    end_index = start_index + items_per_page - 1
    short_list = @students[start_index..end_index] || []
    return existing_list || DataListStudentShort.new([]) if short_list.empty?

    short_list = short_list.map  { |student| StudentShort.from_student(student) }
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
