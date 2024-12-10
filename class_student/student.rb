require_relative 'person'
class Student < Person
  attr_reader :surname, :name, :patronymic, :phone, :telegram, :email

 def initialize(surname:, name:, patronymic:,phone: nil, telegram: nil, email: nil)
    self.surname = surname
    self.name = name
	self.patronymic = patronymic
    set_contacts(phone: phone, telegram: telegram, email: email)
    super(id: id, git: git)
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
  
    def self.valid_phone?(phone)
    phone.nil? || !!(phone =~ /^\d{10}$/)
  end

  def self.valid_telegram?(telegram)
    telegram.nil? || !!(telegram =~ /\A@[\w\d_]{5,}\z/)
  end

  def self.valid_email?(email)
    email.nil? || !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
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
  
    def phone=(value)
    raise ArgumentError, "Неверный номер телефона" unless self.class.valid_phone?(value)
    @phone = value
  end

  def telegram=(value)
    raise ArgumentError, "Неверный формат телеграма" unless self.class.valid_telegram?(value)
    @telegram = value
  end

  def email=(value)
    raise ArgumentError, "Неверный формат почты" unless self.class.valid_email?(value)
    @email = value
  end

  
  # Метод для установки контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end
  
    # Метод для получения контактной информации
  def get_contact
    return "telegram: #{telegram}" unless telegram.nil?
    return "email: #{email}" unless email.nil?
    return "phone: #{phone}" unless phone.nil?
    ""
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
  # Метод для получения фамилии с инициалами
  def get_name_with_initials
    "#{surname} #{name[0]}.#{patronymic[0]}."
  end
  
 def has_contact?
      !@telegram.nil? || !@phone.nil? || !@email.nil?
  end

  def validate?
    has_contact? && has_git?   
  end
end
