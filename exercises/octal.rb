class Octal
  attr_reader :octal_num

  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 unless validate_octal
    number_array = octal_num.to_i.digits

    result = number_array.map.with_index do |digit, index|
      digit*8**index
    end
    result.sum
  end

  private

  def validate_octal
    octal_num.chars.all? {|num| ('0'..'7').include?(num) }
  end
end

# refactored: (removed variables from #to_decimal)

# class Octal
#   attr_reader :octal_num

#   def initialize(octal_num)
#     @octal_num = octal_num
#   end

#   def to_decimal
#     return 0 unless validate_octal
#     octal_num.to_i.digits.map.with_index do |digit, index|
#       digit*8**index
#     end.sum
#   end

#   private

#   def validate_octal
#     octal_num.chars.all? {|num| ('0'..'7').include?(num) }
#   end
# end