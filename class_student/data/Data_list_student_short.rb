require_relative 'data_list'
require_relative 'Data_table'

class DataListStudentShort < DataList
	private

	def column_names
		["ID", "Name", "Git", "Contact"]
	end

	def get_objects_array
		data.map.with_index(1) do |object, index|
			[index, object.surname_initials, object.git, object.contact]
		
		end
	end
end