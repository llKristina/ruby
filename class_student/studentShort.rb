require_relative 'person'
class StudentShort < Person
  attr_reader :surname_initials, :contact

  def initialize(student = nil, id: nil, info_string: nil)
    if student
      initialize_from_student(student)
    elsif id && info_string
      initialize_from_info(id, info_string)
    else
      raise ArgumentError, "Неверные аргументы для создания StudentShort"
    end
  end

  # Инициализация на основе объекта класса Student
  def initialize_from_student(student)
    @id = student.id
    @surname_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic[0]}."
    @git = student.git
    @contact = student.get_contact
  end

  # Инициализация на основе строки с информацией
  def initialize_from_info(id, info_string)
    @id = id
    parts = info_string.split(';').map(&:strip)
    raise ArgumentError, "Некорректный формат строки" if parts.size != 3

    @surname_initials = parts[0]
    @git = parts[1]
    @contact = parts[2]
  end

  # Метод to_s для строкового представления объекта
  def to_s
    "ID: #{@id}, Name: #{@surname_initials}, Git: #{@git}, Contact: #{@contact}"
  end
end