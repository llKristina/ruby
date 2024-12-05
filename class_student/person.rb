class Person
  attr_reader :id, :git, :phone, :telegram, :email

  # Конструктор для базового класса
  def initialize(id: nil, git: nil, phone: nil, telegram: nil, email: nil)
    @id = id
    self.git = git
    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  # Валидация методов
  def self.valid_git?(git)
    !!(git =~ /\Agithub\.com\/[a-zA-Z0-9_-]+\z/)
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

  # Переопределяем сеттеры для контактов
  def git=(value)
    raise ArgumentError, "Неверный формат гита" unless self.class.valid_git?(value)
    @git = value
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
    "контакт отсутствует"
  end
end