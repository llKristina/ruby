class Person
  attr_accessor :id, :last_name, :first_name, :middle_name, :github
  attr_reader :phone, :telegram, :email

  def initialize(params = {})
    @id = params[:id]
    validate_required_fields(params)
    @last_name = params[:last_name]
    @first_name = params[:first_name]
    @middle_name = params[:middle_name]
    @github = params[:github]
    set_contacts(params)
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

  def valid_telegram_handle?(handle)
    !!(handle =~ /\A@[A-Za-z0-9_]{5,32}\z/)
  end

  def valid_email?(email)
    !!(email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def contact_present?
    !(@phone.nil? && @telegram.nil? && @email.nil?)
  end
end
