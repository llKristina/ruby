require_relative 'person'
class Student < Person
  attr_reader :surname, :name, :patronymic

  def initialize(surname:, name:, patronymic:)
    super(id: id, git: git, phone: phone, telegram: telegram, email: email)
    self.surname = surname
    self.name = name
    self.patronymic = patronymic
  end

  def self.valid_surname?(surname)
    surname.nil? || !!(surname =~ /^[A-Za-zА-Яа-я]+$/)
  end

  def self.valid_name?(name)
    name.nil? || !!(name =~ /^[A-Za-zА-Яа-я]+$/)
  end

  def self.valid_patronymic?(patronymic)
    patronymic.nil? || !!(patronymic =~ /^[A-Za-zА-Яа-я]+$/)
  end

  def surname=(value)
    raise ArgumentError, "Некорректный формат фамилии" unless self.class.valid_surname?(value)
    @surname = value
  end

  def name=(value)
    raise ArgumentError, "Некорректный формат имени" unless self.class.valid_name?(value)
    @name = value
  end

  def patronymic=(value)
    raise ArgumentError, "Некорректный формат отчества" unless self.class.valid_patronymic?(value)
    @patronymic = value
  end

  def to_s
    "Student: #{@surname} #{@name} #{@patronymic}\n" \
    "ID: #{@id}\n" \
    "Phone: #{@phone}\n" \
    "Telegram: #{@telegram}\n" \
    "Email: #{@email}\n" \
    "Git: #{@git}"
  end

  # Метод для получения краткой информации
  def getInfo
    "#{get_name_with_initials}; #{git}; #{get_contact}"
  end

 
end
