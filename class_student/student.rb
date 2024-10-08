class Student
def initialize(id:nil, last_name:, first_name:, middle_name:, phone:nil,
 telegram:nil, email:nil, github:nil)
@id=id
@last_name=last_name
@first_name=first_name
@middle_name=middle_name
@phone=phone
@telegram=telegram
@email=email
@github=github
end
#геттеры
def get_id
 @id
end
def get_last_name
 @last_name
end
def get_first_name
 @first_name
end
def get_middle_name
 @middle_name
end
def get_phone
 @phone
end
def get_telegram
 @telegram
end
def get_email
 @email
end
def get_github
 @github
end
#сеттеры
def set_id(id)
 @id=id
end
def set_last_name(last_name)
 @last_name=last_name
end
def set_first_name(first_name)
  @first_name = first_name
 end
def set_middle_name(middle_name)
 @middle_name = middle_name
end
def set_phone(phone)
 @phone = phone
end
def set_telegram(telegram)
 @telegram = telegram
end
def set_email(email)
 @email = email
end
def set_github(github)
 @github = github
end
def to_s
    str = []
    str.push ("ID: #{@id}" ) 
    str.push("Фамилия: #{@last_name}")
    str.push("Имя: #{@first_name}")
    str.push("Отчество: #{@middle_name}")
    str.push("Телефон: #{@phone}") 
    str.push("Телеграм: #{@telegram}" ) 
    str.push("Почта: #{@email}" )
    str.push("GitHub: #{@github}") 
    return str.join("\n")
 end
 
end