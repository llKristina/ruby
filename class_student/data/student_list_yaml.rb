require_relative 'Strategy'
require 'yaml'
require 'date'

class StudentListYAML < Strategy

  def load_students(path_to_file)
    if File.exist?(path_to_file)
      file_content = File.read(path_to_file)
      YAML.parse(file_content, symbolize_names: true)
    else
      return []
    end
  end

  def save_students(path_to_file, students)
    serialized_data = students.map do |student|
      {
        id: student[:id],
        surname: student[:surname],
        name: student[:name],
        patronymic: student[:patronymic],
        phone: student[:phone],
        telegram: student[:telegram],
        email: student[:email],
        git: student[:git]
      }
    end
    File.open(path_to_file, 'w') { |file| file.write(YAML.pretty_generate(serialized_data)) }
  end

end

