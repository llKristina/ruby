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
    @phone = attributes[:phone]
    @telegram = attributes[:telegram]
    @email = attributes[:email]
    @git = attributes[:git]
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
