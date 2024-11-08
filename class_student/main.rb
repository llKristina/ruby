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
  student.validate
  puts student.to_s

  invalid_student = Student.new(
    surname: "Петров",
    name: "Петр",
    patronymic: "Петрович",
	git:"github.com/petrov"
  )
  invalid_student.validate
rescue ArgumentError => e
  puts e.message  
end