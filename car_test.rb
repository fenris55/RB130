require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test

  def setup
    @car = Car.new
  end

  def test_car_exits
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
    car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    array = [1, 2, 3]
    array << @car

    assert_includes(array, @car)
  end

  def test_car_equality # this worked even without defining Car#==
    car1 = Car.new
    car2 = Car.new

    assert_equal(car1, car1)
  end

end