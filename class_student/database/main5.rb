require 'fox16'
require_relative 'student_list_DB'
require_relative 'student_list_controller'
require_relative 'students_window'  

include Fox

app = FXApp.new
StudentsWindow.new(app)  
app.create
app.run     
