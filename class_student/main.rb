require_relative 'student'

student1 = Student.new(surname: "Иванов", name: "Иван", patronymic: "Иванович")

student2 = Student.new(surname: "Иванов", name: "Иван", patronymic: "Иванович", id: 1, phone: "123-456-789", 
telegram: "@ivanov", email: "ivanov@example.com", git: "github.com/ivanov")
puts student1
puts student2