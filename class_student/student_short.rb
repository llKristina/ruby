require_relative 'person'
class Student_short < Person
  attr_reader :id, :last_name_initials, :github, :contact

  # Конструктор для объекта Student
  def initialize(student)
    @id = student.id
    @last_name_initials = student.last_name_initials
    @github = student.github
    @contact = student.contact_info
  end

  # Конструктор для id и строки info
  def initialize(id, info)
    @id = id
    @last_name_initials, @github, @contact = parse_info(info)
  end

  def to_s
    "ID: #{@id}, Фамилия и инициалы: #{@last_name_initials}, GitHub: #{@github}, Контакт: #{@contact}"
  end

  private

  def parse_info(info)
    parts = info.split(';')
    last_name_initials = parts[0].strip
    github = parts[1].split(':')[1].strip
    contact = parts[2].split(':')[1].strip
    [last_name_initials, github, contact]
  end
end