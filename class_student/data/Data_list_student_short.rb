require_relative 'data_list'
require_relative 'Data_table'

class DataListStudentShort < DataList
	
	private

	def column_names
		["ID", "Name", "Git", "Contact"]
	end

	def build_row(index, student)
		[student.id, student.surname_initials, student.git, student.contact]
	end
end