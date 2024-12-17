class ArrayProcessor
  # Конструктор, который принимает массив
  def initialize(array)
    @array = array.freeze  # Замораживаем массив, чтобы он был неизменяемым
  end


  def any?
    @array.each do |element|
      return true if yield(element)
    end
    false
 end
 
 def find_index
    @array.each_with_index do |element, index|
      return index if yield(element)
    end
    nil
 end
 
 def none?
    @array.each do |element|
      return false if yield(element)
    end
    true
 end
 
 def reduce(initial_value = nil)
    accumulator = initial_value
    @array.each do |element|
      if accumulator.nil?
        accumulator = element
      else
        accumulator = yield(accumulator, element)
      end
    end
    accumulator
 end