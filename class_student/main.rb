require_relative 'student'

begin
  student = Student.new(
    surname: "Иванов",
    name: "Иван",
    patronymic: "Иванович",
	id: "1",
    phone: "1234567890",
    email: "ivanov@example.com",
	git:"github.com/ivanov"
  )
  puts student.to_s

  invalid_student = Student.new(
    surname: "Петров",
    name: "Петр",
    patronymic: "Петрович",
    phone: "123abc456",
    email: "petrov@example.com"
  )
rescue ArgumentError => e
  puts e.message  
end