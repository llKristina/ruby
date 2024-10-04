class Student
attr_accessor :id, :last_name, :first_name, :middle_name, 
:phone, :telegram, :email, :github

def initialize(id:nil, last_name:, first_name:, middle_name:, phone:nil,
 telegram:nil, email:nil, github:nil)
@id=id
@last_name=last_name
@first_name=first_name
@middle_name=middle_name
if phone.nil? || self.class.valid_phone?(phone)
      @phone = phone
    else
      raise ArgumentError, "Недопустимый номер телефона: #{phone}"
    end
@telegram=telegram
@email=email
@github=github
end

 def self.valid_phone?(phone)
   return true if phone.nil?
    !!(phone =~ /\A\+?[0-9]{10,15}\z/)
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