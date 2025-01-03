class DataList
  private attr_reader :data, :column_names
  private attr_accessor :selected

  def initialize(data, column_names = [])
    self.data = data.sort
    self.column_names = column_names
    @selected = []
  end

  def elements
    data.dup.freeze
  end

  def select(number)
    if number.between?(0, data.size - 1)
      selected << number unless selected.include?(number)
    end
  end

  def get_selected
    selected
  end

  def get_names
    raise NotImplementedError, "This method must be implemented in a subclass."
  end

  def get_data
    raise NotImplementedError, "This method must be implemented in a subclass."
  end
end

