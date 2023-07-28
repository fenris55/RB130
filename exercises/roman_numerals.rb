# second attempt taken by following the provided PEDAC
# (only checked code to see how the 9s and 4s were handled)
# my approach is much longer, but performs this computation correctly. 
 
# class RomanNumeral
#   ROMAN_CHARS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 
#                 100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X',
#                 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'}

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman = ''
#     ROMAN_CHARS.each do |int, char|
#       if @number >= int
#         current_value = int

#         loop do
#         roman << char
#         current_value += int
#         break if current_value > @number
#         end

#          @number -= current_value - int
#       end
#     end
#     roman
#   end
# end

# first attempt: 
class RomanNumeral
  attr_reader :num

  def initialize(number)
    @integer = number
    @num = number.digits.reverse
  end

  def to_roman
    roman = ''
    
    roman << convert_to_thousands if num.size > 3
    roman << convert_to_hundreds if num.size > 2  
    roman << convert_to_tens if num.size > 1
    roman << convert_to_ones
    
    roman
  end

  def convert_to_thousands
    'M' * num.shift 
  end

  def convert_to_hundreds
    target_num = num.shift
    case target_num
    when 0      then ''
    when (1..3) then 'C' * target_num
    when 4      then 'CD'
    when 5      then 'D'
    when (6..8) then 'D' + ('C' * (target_num - 5))
    else             'CM'
    end 
  end

  def convert_to_tens
    target_num = num.shift
    case target_num
    when 0      then ''
    when (1..3) then 'X' * target_num
    when 4      then 'XL'
    when 5      then 'L'
    when (6..8) then 'L' + ('X' * (target_num - 5))
    else             'XC'
    end 
  end

  def convert_to_ones
    target_num = num.shift
    case target_num
    when 0      then ''
    when (1..3) then 'I' * target_num
    when 4      then 'IV'
    when 5      then 'V'
    when (6..8) then 'V' + ('I' * (target_num - 5))
    else             'IX'
    end 
  end
end