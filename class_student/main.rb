require_relative 'student'

begin
  student1 = Student.new(id: 1, last_name: "Капустин", first_name: "Андрей", 
  middle_name: "Владимирович", phone: '+79894032567', telegram: "@kapusta", 
  email: "andreyV@example.com", github: "kapustaVV")

  student2 = Student.new(last_name: "Петрова", first_name: "Мария",  
  middle_name: "Андреевна",phone: '+79824162767', github: "mariaGitHub")

  puts "Информация о студенте 1:"
  puts student1.to_s

  puts "\n**Информация о студенте 2:"
  puts student2.to_s

rescue ArgumentError => e
  puts "Ошибка создания студента:"
  puts e.message
end
