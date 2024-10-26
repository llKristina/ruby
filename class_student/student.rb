require_relative 'person'
class Student < Person
 def get_info
    "#{last_name} #{first_name[0]}#{middle_name[0]}; GitHub: #{github}; Контакт: #{contact_info}"
  end

  def last_name_initials
    "#{last_name} #{first_name[0]}#{middle_name[0]}"
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
