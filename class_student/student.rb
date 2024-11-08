class Student
  # Объявляем геттеры и сеттеры 
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор принимает аргументы в виде хэша
  def initialize(attributes = {})
    # Устанавливаем обязательные поля
    @surname = attributes[:surname] 
    @name = attributes[:name] 
    @patronymic = attributes[:patronymic] 

    # Устанавливаем необязательные поля
    @id = attributes[:id]
    self.phone = attributes[:phone]  # Используем сеттер для валидации
    @telegram = attributes[:telegram]
    @email = attributes[:email]
    @git = attributes[:git]
  end
  
   # Метод для проверки, является ли строка телефонным номером
  def self.valid_phone?(phone)
    !!(phone =~ /^\d{10}$/)
  end

  # Переопределяем сеттер для поля phone
  def phone=(value)
    raise ArgumentError, "Неверный номер телефона" unless self.class.valid_phone?(value)

    @phone = value
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
