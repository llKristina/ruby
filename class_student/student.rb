class Student
  # Объявляем геттеры и сеттеры 
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор
  def initialize(surname, name, patronymic, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    # Устанавливаем обязательные параметры
    @surname = surname
    @name = name
    @patronymic = patronymic

    # Устанавливаем необязательные параметры, проверяя на наличие значений
    @id = id unless id.nil?
    @phone = phone unless phone.nil?
    @telegram = telegram unless telegram.nil?
    @email = email unless email.nil?
    @git = git unless git.nil?
  end
end
