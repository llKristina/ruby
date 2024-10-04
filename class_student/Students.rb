class Student
  attr_accessor :id, :last_name, :middle_name, :first_name
  attr_reader :phone, :telegram, :email, :github # Контакты теперь нельзя устанавливать напрямую

  def initialize(id:nil, last_name:, first_name:, middle_name:, phone:nil,
                 telegram:nil, email:nil, github:nil)
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

    if phone.nil? || self.class.valid_phone?(phone)
      @phone = phone
    else
      raise ArgumentError, "Недопустимый номер телефона: #{phone}"
    end

    if telegram.nil? || self.class.valid_telegram?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Недопустимый телеграм: #{telegram}"
    end

    if email.nil? || self.class.valid_email?(email)
      @email = email
    else
      raise ArgumentError, "Недопустимый email: #{email}"
    end

    if github.nil? || self.class.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "Недопустимый GitHub: #{github}"
    end
  end

  def self.valid_phone?(phone)
    return true if phone.nil?
    !!(phone =~ /\A\+?[0-9]{10,15}\z/)
  end

  def self.valid_name?(name)
    !!(name =~ /\A[А-Яа-яёЁA-Za-z\-]{2,50}\z/)
  end

  def self.valid_telegram?(handle)
    !!(handle =~ /\A@[A-Za-z0-9_]{5,32}\z/)
  end

  def self.valid_email?(email)
    !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def self.valid_github?(handle)
    !!(handle =~ /\A[A-Za-z0-9\-]{1,39}\z/)
  end

  # Метод проверки наличия контакта для связи
  def contact_present?
    !(@phone.nil? && @telegram.nil? && @email.nil?)
  end

  def validate
    unless contact_present?
      raise ArgumentError, "Необходимо указать хотя бы один контакт для связи"
    end

    if @github.nil? || @github.empty?
      raise ArgumentError, "Необходимо указать GitHub"
    end
  end

  # Метод установки контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    if phone
      if self.class.valid_phone?(phone) # исправлено имя метода на valid_phone
        @phone = phone
      else
        raise ArgumentError, "Недопустимый номер телефона: #{phone}"
      end
    end

    if telegram
      if self.class.valid_telegram?(telegram) # исправлено имя метода на valid_telegram
        @telegram = telegram
      else
        raise ArgumentError, "Недопустимый телеграм: #{telegram}"
      end
    end

    if email
      if self.class.valid_email?(email)
        @email = email
      else
        raise ArgumentError, "Недопустимый email: #{email}"
      end
    end

    validate
  end

  # Метод получения информации
  def getInfo
    "#{last_name_with_initials}; GitHub: #{@github}; Contact: #{preferred_contact}"
  end

  def last_name_with_initials
    "#{@last_name} #{initials}"
  end

  def preferred_contact
    if @phone
      "Phone: #{@phone}"
    elsif @telegram
      "Telegram: #{@telegram}"
    elsif @email
      "Email: #{@email}"
    else
      "No contact available"
    end
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
  
  private

  def initials
    "#{@first_name[0]}. #{@middle_name[0]}."
  end
end

class StudentShort < Student
attr_accessor :id, :full_name, :github, :contact
 # Конструктор, принимающий объект класса Student
   def initialize(student)
    super(
      id: student.id, last_name: student.last_name, first_name: student.first_name, 
      middle_name: student.middle_name, phone: student.phone, telegram: student.telegram, 
      email: student.email, github: student.github)
    @full_name = student.last_name_with_initials
    @contact = student.preferred_contact
  end
  
 # Конструктор, принимающий ID и строку с информацией
  def self.from_string(id, info_str)
    full_name, github, contact = info_str.split(',').map(&:strip)
	last_name, initials = full_name.split(' ', 2)
    first_name, middle_name = initials.split('.').map(&:strip)
    new_instance = allocate
    new_instance.instance_variable_set(:@id, id)
    new_instance.instance_variable_set(:@full_name, full_name)
    new_instance.instance_variable_set(:@github, github)
    new_instance.instance_variable_set(:@contact, contact)
    new_instance.instance_variable_set(:@last_name, last_name)
    new_instance.instance_variable_set(:@first_name, first_name)
	new_instance.instance_variable_set(:@middle_name, middle_name)
    new_instance
  end

  def to_s
    "ID: #{@id}, Name: #{@full_name}, GitHub: #{@github}, Contact: #{@contact}"
  end
end