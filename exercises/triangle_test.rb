require 'minitest/autorun'
require_relative 'triangle'

class TriangleTest < Minitest::Test

  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal('Equilateral', triangle.type)
  end

  def test__bigger_equilateral_equal_sides
    triangle = Triangle.new(10, 10, 10)
    assert_equal('Equilateral', triangle.type)
  end

  def test_isosceles_first_two_sides_equal
    triangle = Triangle.new(2, 2, 3)
    assert_equal 'Isoceles', triangle.type
  end

  def test_isoceles_last_two_sides_equal
    triangle = Triangle.new(4, 7, 4)
    assert_equal 'Isoceles', triangle.type
  end

  def test_isoceles_first_and_last_sides_equal
    triangle = Triangle.new(12, 20, 12)
    assert_equal 'Isoceles', triangle.type
  end 

  def test_scalene_no_equal_sides
    triangle = Triangle.new(2, 3, 4)
    assert_equal 'Scalene', triangle.type
  end

  def test_small_scalene
    triangle = Triangle.new(0.4, 0.6, 0.3)
    assert_equal 'Scalene', triangle.type
  end

  def test_bigger_scalene_no_equal_sides
    triangle = Triangle.new(13, 15, 17)
    assert_equal 'Scalene', triangle.type
  end 

  def test_side_with_length_zero_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 3, 4)
    end
  end

  def test_side_less_than_zero_illegal
    assert_raises(ArgumentError) do 
      triangle = Triangle.new(3, 4, -2) 
    end
  end

  def test_size_inequality_illegal
    assert_raises(ArgumentError) do 
      triangle =Triangle.new(7, 3, 2)
    end
  end

end