class Student
  attr_reader :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор принимает аргументы в виде хэша
 def initialize(id: nil, surname:, name:, patronymic:, git: nil, phone: nil, telegram: nil, email: nil)  
    self.surname = surname 
    self.name = name 
    self.patronymic = patronymic 

    # Устанавливаем необязательные поля с валидацией через сеттеры
    @id = id
    self.git = git
	set_contacts(
      phone: phone,
      telegram:telegram,
      email: email
    )
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
  
   # Метод для проверки, является ли строка телефонным номером
  def self.valid_phone?(phone)
   phone.nil? || !!(phone =~ /^\d{10}$/)
  end
  
   # Метод класса для проверки корректности Telegram 
  def self.valid_telegram?(telegram)
   telegram.nil? || !!(telegram =~ /\A@[\w\d_]{5,}\z/)
  end
  
   # Метод класса для проверки корректности email
  def self.valid_email?(email)
    email.nil? || !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  # Метод класса для проверки корректности Git
  def self.valid_git?(git)
    !!(git =~ /\Agithub\.com\/[a-zA-Z0-9_-]+\z/)
  end


  # Переопределяем сеттеры
  
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

  
  def git=(value)
    raise ArgumentError, "Неверный формат гита" unless self.class.valid_git?(value)
    @git = value
  end
  
   # Метод проверки наличия Git и любого контакта
  def validate?
  git_present? && contact_present?

  true
end

  
   # Метод для установки контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end
  
  def to_s
    "Student: #{@surname} #{@name} #{@patronymic}\n" \
    "ID: #{@id}\n" \
    "Phone: #{@phone}\n" \
    "Telegram: #{@telegram}\n" \
    "Email: #{@email}\n" \
    "Git: #{@git}"
  end
  
  
    # Основной метод получения краткой информации
  def getInfo
    "#{get_name_with_initials}; #{git}; #{get_contact}"
  end
   
  private
  
   # Метод для получения инициалов
  def get_initials
    "#{name[0]}.#{patronymic[0]}."
  end

  # Метод для получения фамилии с инициалами
  def get_name_with_initials
    "#{surname} #{get_initials}"
  end

  # Метод для получения контактной информации
  def get_contact
    return "telegram: #{telegram}" unless telegram.nil?
    return "email: #{email}" unless email.nil?
    return "phone: #{phone}" unless phone.nil?
    "контакт отсутствует"
  end

  # Проверка наличия Git
  def git_present?
    !@git.nil? && @git.strip != ""
  end

  # Проверка наличия любого контакта
  def contact_present?
    (!@phone.nil? && @phone.strip != "") || 
    (!@telegram.nil? && @telegram.strip != "") || 
    (!@email.nil? && @email.strip != "")
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
  
end

class Student_short
  attr_reader :id, :name_initials, :git, :contact

  # Конструктор, принимающий объект класса Student
  def initialize(student_or_id, info = nil)
    if student_or_id.is_a?(Student)
      student = student_or_id
      @id = student.id
      @name_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic[0]}."
      @git = student.git
      @contact = get_contact(student)
    elsif student_or_id.is_a?(Integer) && info.is_a?(String)
      @id = student_or_id
      parse_info_string(info)
    else
      raise ArgumentError, "Неверные аргументы конструктора"
    end
  end

  private

  # Метод для получения контакта из объекта Student
  def get_contact(student)
    return "telegram: #{student.telegram}" unless student.telegram.nil?
    return "email: #{student.email}" unless student.email.nil?
    return "phone: #{student.phone}" unless student.phone.nil?
    "контакт отсутствует"
  end

  # Метод для разбора строки с информацией
  def parse_info_string(info)
    parts = info.split(';').map(&:strip)
    raise ArgumentError, "Неверный формат строки" unless parts.length == 3

    @name_initials = parts[0]
    @git = parts[1]
    @contact = parts[2]
  end
end