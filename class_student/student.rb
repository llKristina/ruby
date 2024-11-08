class Student
  # Объявляем геттеры и сеттеры 
  attr_accessor :id, :surname, :name, :patronymic, :git
  attr_reader :phone, :telegram, :email

  # Конструктор принимает аргументы в виде хэша
  def initialize(attributes = {})
    # Устанавливаем обязательные поля
    @surname = attributes[:surname] 
    @name = attributes[:name] 
    @patronymic = attributes[:patronymic] 

    # Устанавливаем необязательные поля с валидацией через сеттеры
    @id = attributes[:id]
    self.git = attributes[:git]
	set_contacts(
      phone: attributes[:phone],
      telegram: attributes[:telegram],
      email: attributes[:email]
    )
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
  def git=(value)
    raise ArgumentError, "Неверный формат гита" unless self.class.valid_git?(value)
    @git = value
  end
  
   # Метод проверки наличия Git и любого контакта
  def validate
    unless git_present?
      raise ArgumentError, "Git обязателен."
    end

    unless contact_present?
      raise ArgumentError, "Необходимо указать хотя бы один контакт (Телефон, Telegram или Email)."
    end
  end
  
   # Метод для установки контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone
    self.telegram = telegram
    self.email = email
  end
  
  def to_s
   "Student: #{@surname} #{@name} #{@patronymic}
    ID: #{@id} 
	Phone: #{@phone}
    Telegram: #{@telegram} 
	Email: #{@email}
	Git: #{@git}"
  end
  private

  # Проверка наличия Git
  def git_present?
    !@git.nil? && @git.strip != ""
  end

  # Проверка наличия любого контакта
  def contact_present?
    !@phone.nil? && @phone.strip != "" || !@telegram.nil? && @telegram.strip != "" || !@email.nil? && @email.strip != ""
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
