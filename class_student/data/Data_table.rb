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

  def get_element(row, col)
    return nil unless row.between?(0, @data.size - 1) && col.between?(0, @data[0].size - 1)

    @data[row][col]
  end

  def column_count
    @data[0]&.size || 0
  end

  def row_count
    @data.size
  end
end

