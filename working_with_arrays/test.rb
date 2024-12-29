require_relative "./array_processor"  
require 'minitest/autorun'

class ArrayProcessorTest < Minitest::Test
  def setup
    @array_processor = ArrayProcessor.new([1, 2, 3, 4, 5])
    @empty_processor = ArrayProcessor.new([])
  end

  def test_any
    assert_equal true, @array_processor.any? { |x| x > 3 }
    assert_equal false, @array_processor.any? { |x| x > 10 }
  end

  def test_find_index
    assert_equal 3, @array_processor.find_index { |x| x == 4 }
    assert_nil @array_processor.find_index { |x| x > 10 }
  end

  def test_none
    assert_equal true, @array_processor.none? { |x| x > 10 }
    assert_equal false, @array_processor.none? { |x| x == 3 }
  end

  def test_reduce
    assert_equal 15, @array_processor.reduce(0) { |sum, x| sum + x }
    assert_equal 120, @array_processor.reduce(1) { |prod, x| prod * x }
    assert_equal 1, @array_processor.reduce { |min, x| min < x ? min : x }
  end

  def test_min_max
    assert_equal [1, 5], @array_processor.min_max
    assert_nil @empty_processor.min_max if @empty_processor
  end

  def test_find_all
    assert_equal [2, 4], @array_processor.find_all { |x| x.even? }
    assert_equal [], @array_processor.find_all { |x| x > 10 }
  end
end
