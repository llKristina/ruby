require_relative 'students'

student1 = Student.new(id:1, last_name:"Капустин", first_name:"Андрей", 
middle_name:"Владимирович", phone:"89183456789",telegram:"@kapusta",
email: "andreyV@example.com", github:"kapustaVV")

student2 = Student.new(last_name:"Петрова", first_name:"Мария", middle_name:"Андреевна")

puts "Информация о студенте 1:"
puts student1.to_s

puts "\nИнформация о студенте 2:"
puts student2.to_s


