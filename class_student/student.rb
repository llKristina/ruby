class Person
  attr_reader :id, :last_name, :first_name, :middle_name, :github, :phone, :telegram, :email

  def initialize(params = {})
    @id = params[:id]

    validate_required_fields(params)

    @last_name = params[:last_name]
    @first_name = params[:first_name]
    @middle_name = params[:middle_name]
    @github = params[:github]

    set_contacts(params)
  end

  def last_name_initials
    "#{@last_name} #{first_name[0]}#{middle_name[0]}"
  end

  def contact_info
    if @phone
      "Телефон: #{@phone}"
    elsif @telegram
      "Телега: #{@telegram}"
    elsif @email
      "Почта: #{@email}"
    else
      "Нет контактов"
    end
  end

  private

  def validate_required_fields(params)
    raise ArgumentError, "Необходимо указать фамилию" unless params[:last_name]
    raise ArgumentError, "Необходимо указать имя" unless params[:first_name]
    raise ArgumentError, "Необходимо указать отчество" unless params[:middle_name]
    raise ArgumentError, "Необходимо указать GitHub" unless params[:github]
  end

  def set_contacts(params)
    @phone = params[:phone] if valid_phone_number?(params[:phone])
    @telegram = params[:telegram] if valid_telegram_handle?(params[:telegram])
    @email = params[:email] if valid_email?(params[:email])

    raise ArgumentError, "Необходимо указать хотя бы один контакт для связи" unless contact_present?
  end

  def valid_phone_number?(phone)
    !!(phone =~ /\A\+?[0-9]{10,15}\z/)
  end

  def valid_name?(name)
    !!(name =~ /\A[А-Яа-яёЁA-Za-z\-]{2,50}\z/)
  end

  def valid_telegram_handle?(handle)
    !!(handle =~ /\A@[A-Za-z0-9_]{5,32}\z/)
  end

  def valid_email?(email)
    !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def valid_github_handle?(handle)
    !!(handle =~ /\A[A-Za-z0-9\-]{1,39}\z/)
  end

  def contact_present?
    !(@phone.nil? && @telegram.nil? && @email.nil?)
  end
end

class Student < Person
  def initialize(params = {})
    super(params)
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
end

class Student_short < Person
  attr_reader :id, :last_name_initials, :github, :contact

  # Конструктор для объекта Student
  def initialize(student)
    @id = student.id
    @last_name_initials = student.last_name_initials
    @github = student.github
    @contact = student.contact_info
  end

  # Конструктор для id и строки info
  def initialize(id, info)
    @id = id
    @last_name_initials, @github, @contact = parse_info(info)
  end

  def to_s
    "ID: #{@id}, Фамилия и инициалы: #{@last_name_initials}, GitHub: #{@github}, Контакт: #{@contact}"
  end

  private

  def parse_info(info)
    parts = info.split(';')
    last_name_initials = parts[0].strip
    github = parts[1].split(':')[1].strip
    contact = parts[2].split(':')[1].strip
    [last_name_initials, github, contact]
  end
end