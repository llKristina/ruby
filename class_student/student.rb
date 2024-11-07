class Student
  # Объявляем геттеры и сеттеры 
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор
  def initialize(surname, name, patronymic, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    # Устанавливаем обязательные параметры
    @surname = surname
    @name = name
    @patronymic = patronymic

    # Устанавливаем необязательные параметры 
    @id = id
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end
end
