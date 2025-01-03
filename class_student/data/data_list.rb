class DataList
  private attr_reader :data
  private attr_accessor :selected

  def initialize(data, column_names = [])
    self.data = data.sort
    self.column_names = column_names
    @selected = []
  end

  def select(number)
    if number.between?(0, data.size - 1)
      @selected << number unless @selected.include?(number)
    end
  end

  def get_selected
    @selected
  end

  def get_names
	@column_names
  end

    def get_data
        result = [self.get_names]
        self.selected.each do |selected_index|
            obj = self.data[selected_index]
			row = build_row(selected_index + 1, obj)            
			result << row
        end
        DataTable.new(result)
    end

    def data=(data)
        @data = data
        @selected = []
    end
	
	private

    def column_names
        raise NotImplementedError, "Метод не реализован в классе Data_list"
    end
    
    def build_row(index, element)
        raise NotImplementedError, "Метод не реализован в классе Data_list"
    end
	
end

