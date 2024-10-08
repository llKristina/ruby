class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  def initialize(id:nil, last_name:, first_name:, middle_name:, phone:nil, telegram:nil, email:nil, github:nil)
    @id = id
    
    if self.class.valid_name?(last_name)
      @last_name = last_name
    else
      raise ArgumentError, "Недопустимая фамилия: #{last_name}"
    end
    
    if self.class.valid_name?(first_name)
      @first_name = first_name
    else
      raise ArgumentError, "Недопустимое имя: #{first_name}"
    end
    
    if self.class.valid_name?(middle_name)
      @middle_name = middle_name
    else
      raise ArgumentError, "Недопустимое отчество: #{middle_name}"
    end
    
    if phone.nil? || self.class.valid_phone_number?(phone)
      @phone = phone
    else
      raise ArgumentError, "Недопустимый номер телефона: #{phone}"
    end
    
    if telegram.nil? || self.class.valid_telegram_handle?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Недопустимый телеграм: #{telegram}"
    end
    
    if email.nil? || self.class.valid_email?(email)
      @email = email
    else
      raise ArgumentError, "Недопустимый email: #{email}"
    end
    
    if github.nil? || self.class.valid_github_handle?(github)
      @github = github
    else
      raise ArgumentError, "Недопустимый GitHub: #{github}"
    end
    
    validate
  end

  def to_s
    str = []
    str.push("ID: #{@id}") if @id
    str.push("Фамилия: #{@last_name}")
    str.push("Имя: #{@first_name}")
    str.push("Отчество: #{@middle_name}")
    str.push("Телефон: #{@phone}") if @phone
    str.push("Телеграм: #{@telegram}") if @telegram
    str.push("Почта: #{@email}") if @email
    str.push("GitHub: #{@github}") if @github
    str.join("\n")
  end

  # Валидационные методы
  def self.valid_phone_number?(phone)
    return true if phone.nil?
    !!(phone =~ /\A\+?[0-9]{10,15}\z/)
  end

  def self.valid_name?(name)
    !!(name =~ /\A[А-Яа-яёЁA-Za-z\-]{2,50}\z/)
  end

  def self.valid_telegram_handle?(handle)
    !!(handle =~ /\A@[A-Za-z0-9_]{5,32}\z/)
  end

  def self.valid_email?(email)
    !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def self.valid_github_handle?(handle)
    !!(handle =~ /\A[A-Za-z0-9\-]{1,39}\z/)
  end

  # Метод проверки наличия контакта для связи
  def contact_present?
    !(@phone.nil? && @telegram.nil? && @email.nil?)
  end

  # Метод validate, который объеденяет проверки
  def validate
    unless contact_present?
      raise ArgumentError, "Необходимо указать хотя бы один контакт для связи"
    end

    if @github.nil? || @github.empty?
      raise ArgumentError, "Необходимо указать GitHub"
    end
  end
end

