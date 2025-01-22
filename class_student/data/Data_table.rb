class DataTable
  private attr_reader :data

  def initialize(data)
    self.data = data
  end

  private def data=(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Объект должен являться двумерным массивом"
    end
    @data = data
  end
  
  def inspect
    @data.map { |row| row.join(" | ") }.join("\n")  
  end

  def get_element(row,col)
		raise IndexError, "Неверный индекс строки" if row < 0 || row >= row_count
		raise IndexError, "Неверный индекс столбца" if col < 0 || col >= column_count

		data[row][col]
	end

  def column_count
    @data[0].size || 0
  end

  def row_count
    @data.size
  end
end

