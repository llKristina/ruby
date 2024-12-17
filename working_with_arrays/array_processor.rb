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