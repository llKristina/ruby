require_relative 'student'
require_relative 'StudentShort'
begin
  student = Student.new(
	id: "1",
    surname: "Иванов",
    name: "Иван",
    patronymic: "Иванович",
    phone: "1234567890",
    email: "ivanov@example.com",
	git:"github.com/ivanov"
  )


  invalid_student = Student.new(
    surname: "Петров",
    name: "Петр",
    patronymic: "Петрович",
	git:"github.com/petrov"
  )

  
 puts student_short_from_student = StudentShort.from_student(student)
  
rescue ArgumentError => e
  puts e.message  
end