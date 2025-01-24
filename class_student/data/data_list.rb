require_relative 'data_table'
class DataList
  private attr_reader :data
  private attr_accessor :selected

  def initialize(data, column_names = [])
    self.data = data
    @selected = (0...data.size).to_a 
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
	column_names
  end

  def get_data
    result = [get_names]
    @selected.each do |index|
      obj = @data[index]  
      row = build_row(index + 1, obj) 
      result << row
    end
    result  
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

