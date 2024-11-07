class Student
  # Инициализация объекта Student с обязательными и необязательными полями
  def initialize(surname, name, patronymic, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    @surname = surname
    @name = name
    @patronymic = patronymic
    @id = id
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  # Геттеры и сеттеры для ID
  def id
    @id
  end

  def id=(value)
    @id = value
  end

  # Геттеры и сеттеры для Фамилии
  def surname
    @surname
  end

  def surname=(value)
    @surname = value
  end

  # Геттеры и сеттеры для Имени
  def name
    @name
  end

  def name=(value)
    @name = value
  end

  # Геттеры и сеттеры для Отчества
  def patronymic
    @patronymic
  end

  def patronymic=(value)
    @patronymic = value
  end

  # Геттеры и сеттеры для Телефона
  def phone
    @phone
  end

  def phone=(value)
    @phone = value
  end

  # Геттеры и сеттеры для Телеграм
  def telegram
    @telegram
  end

  def telegram=(value)
    @telegram = value
  end

  # Геттеры и сеттеры для Почты
  def email
    @email
  end

  def email=(value)
    @email = value
  end

  # Геттеры и сеттеры для Гит
  def git
    @git
  end

  def git=(value)
    @git = value
  end
end
