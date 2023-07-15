class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other_car)
    other_car.is_a?(Car) && other_car.name == name
  end
end