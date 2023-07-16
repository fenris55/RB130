# require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

# class NoExperienceError < StandardError; end

# class Employee
#   attr_reader :experience

#   def hire
#     raise NoExperienceError
#   end

# end
  
# class TestClass < Minitest:: Test
  # def setup
  #   @list = ['xyz']
  # end

  #implementing both suggested tests
  # def test_odd_question
  #   value = 3
  #   value2 = 4
  #   assert(value.odd?, "value is not odd")
  #   assert_equal(true, value.odd?)
  # end

  # def test_downcase
  #   value = 'XYZ'
  #   assert_equal('xyz', value.downcase)
  # end

  # def test_nil_value
  #   value = nil
  # #   assert_equal nil, value # deprecated; passes but suggests using #assert_nil
  #   assert_nil value # lesson solutions are now using this syntax, with no ()
  # end

  # def test_for_empty_array
  #   list = []
  #   # assert_equal [], list # passes but solution uses #assert_empty:
  #   # assert_equal true, list.empty? # also works
  #   assert_empty list # preferred because it delivers a better error message
  # end

  # def test_array_contents
  #   list = ['xyz']
  #   assert_includes list, 'xyz'
  # end

#   def test_hire
#     employee = Employee.new
#     assert_raises(NoExperienceError) {employee.hire}
#   end
# end

# 1.1 - 1.6 are above
# moving forward, practicing setup for each test separately

# not sure how this can work without creating a class and instantiating test objects
# note: this is given as an example of a better test
# for the exercises, only the method body is needed
# def test_odd_question
#   assert_equal(true, value.odd?)
# end

# #lesson solution just uses assert:
# # assert checks if first value is truthy
# # if not, second argument (custom error message/string) is returned

# assert value.odd?, "value not odd"

# 1.7

# require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

# class NumericTest < Minitest::Test

  # def test_numeric_class
  #   value = Numeric.new
  #   assert_same Numeric, value.class
  # end

#from solution, uses: #assert_instance_of
#   def test_numeric_class
#     value = Numeric.new
#     assert_instance_of Numeric, value
#   end
# end

# 1.8

# require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

# class NumericTest < Minitest::Test
#   def test_numeric_ancestor
#     value = 2 # testing integer
#     # value2 = 1.3 #testing float
#     # string = "Strings don't inherit from Numeric!" #testing a string

#     # assert_equal(true, value.class.ancestors.include?(Numeric))
#     # assert_equal(true, value2.class.ancestors.include?(Numeric))
#     # assert_equal(false, string.class.ancestors.include?(Numeric))

#     #lesson solution uses #assert_kind_of: 
#     assert_kind_of(Numeric, value)
#   end
# end

# 1.9
# require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

# class List
#   def process
#     self
#   end
# end

# class ObjectTest < Minitest::Test

#   def test_same_object
#     list = List.new
#     assert_same(list, list.process)
#   end 
# end

# 1.10
require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!

class NewListTest < Minitest::Test
  def test_list_contents
    list = [3, 'apple', 4.5]
    # assert_equal(true, !list.include?('xyz'))
    #assert_includes can't work here, so solution uses #refute_includes
    refute_includes(list, 'xyz')
  end
end
