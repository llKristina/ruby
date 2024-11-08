class Student
  # Объявляем геттеры и сеттеры 
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор принимает аргументы в виде хэша
  def initialize(attributes = {})
    # Устанавливаем обязательные поля
    @surname = attributes[:surname] 
    @name = attributes[:name] 
    @patronymic = attributes[:patronymic] 

    # Устанавливаем необязательные поля с валидацией через сеттеры
    @id = attributes[:id]
    self.phone = attributes[:phone]  
    self.telegram = attributes[:telegram]
    self.email = attributes[:email]
    self.git = attributes[:git]
  end
  
   # Метод для проверки, является ли строка телефонным номером
  def self.valid_phone?(phone)
    !!(phone =~ /^\d{10}$/)
  end
  
   # Метод класса для проверки корректности Telegram 
  def self.valid_telegram?(telegram)
    !!(telegram =~ /\A@[\w\d_]{5,}\z/)
  end
  
   # Метод класса для проверки корректности email
  def self.valid_email?(email)
    !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  # Метод класса для проверки корректности URL для Git
  def self.valid_git?(git)
    !!(git =~ /\Agithub\.com\/[a-zA-Z0-9_-]+\z/)
  end


  # Переопределяем сеттеры
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

  def git=(value)
    raise ArgumentError, "Неверный формат гита" unless self.class.valid_git?(value)
    @git = value
  end
  
   def to_s
   "Student: #{@surname} #{@name} #{@patronymic}
    ID: #{@id} 
	Phone: #{@phone}
    Telegram: #{@telegram} 
	Email: #{@email}
	Git: #{@git}"
  end
end
