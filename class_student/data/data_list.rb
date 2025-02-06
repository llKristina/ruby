require_relative 'data_table'
class DataList
  attr_reader :data, :selected, :column_names
    def initialize(data)
      self.data = data
      @selected = []
      @column_names = get_names
      end
    def select(number)
      element = @data[number]
      if element && !@selected.include?(element.id)
        @selected << element.id
      end
    end
  
    def get_selected
      @selected.dup
    end
  
    def get_data
      data = get_objects_array
      DataTable.new(data)
    end

  def set_data(new_data)
    raise ArgumentError, "Объект должен являться массивом" unless new_data.is_a?(Array)
    self.data = new_data
  end
  
    def data=(new_data)
    # Преобразуем в массив, если данные не являются массивом
    new_data = Array(new_data) unless new_data.is_a?(Array)
    @data = new_data.map { |element| deep_dup(element) }
  end

    def get_objects_array
		raise NotImplementedError, "Метод не реализован в классе"
	  end

  def get_names
    raise NotImplementedError, "Метод не реализован в классе"
  end

    def deep_dup(element)
      return nil if element.nil?
  
      if element.is_a?(Array)
        element.map { |sub_element| deep_dup(sub_element) }
      else
        element.dup rescue element
      end
    end
  end

