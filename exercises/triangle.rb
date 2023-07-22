class Triangle
  attr_reader :sides
  
  def initialize(s1, s2, s3)
    @sides = [s1.to_f, s2.to_f, s3.to_f]
    raise ArgumentError unless valid_sides?
  end

  def type
    number_of_unique_sides = @sides.uniq.size

    case number_of_unique_sides
    when 3 then return "Scalene"
    when 2 then return "Isoceles"
    when 1 then return "Equilateral"
    end
  end

  private

  def valid_sides?
    sorted_sides = sides.sort
    sum_test = (sorted_sides[0] + sorted_sides[1]) > sorted_sides[2]
  
    sides.min > 0 && sum_test
  end
end
