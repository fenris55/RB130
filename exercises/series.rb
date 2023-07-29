class Series
  attr_reader :string_number

  def initialize(string_number)
    @string_number = string_number
  end

  def slices(length)
    raise ArgumentError if length > string_number.length
    result = []
    end_point = string_number.length - length
    (0..end_point).each do |index|
      substring = string_number[index, length]
      subarray = []
      substring.each_char do |num|
        subarray << num.to_i
      end
      result << subarray
    end
    result
  end
end

# refactored: 
# class Series
#   attr_reader :string_number

#   def initialize(string_number)
#     @string_number = string_number
#   end

#   def slices(length)
#     raise ArgumentError if length > string_number.length
#     substrings = get_substrings(length)
#     substrings.map do |substring|
#       subarray = []
#       substring.each_char do |num|
#         subarray << num.to_i
#       end
#       subarray
#     end
#   end
  
#   private 
  
#   def get_substrings(length)
#   result = []
#     end_point = string_number.length - length
#     (0..end_point).each do |index|
#       result << string_number[index, length]
#     end
#     result
#   end
# end