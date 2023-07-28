# 1.1

#Initial thoughts: 

# P:
# Write a problem that idenitfies is a triangle is isoceles, equilateral, or scalene

# rules: 
# - valid triangles have 2 criteria
#   -all sides have length > 0
#    - sum of any 2 sides is greater than third
#    (imp note: sort, add 2 smallest and compare to largest)

# -isosceles: all sides equal
# -equilateral: 2 sides equal
# -scalene; no sides equal

# E:
# 30, 30, 30  => isoceles
# 20, 20, 22 => equilateral 
# 21, 22, 15 => scalene
# 0, 3, 5 => invalid (0)
# 12, -13, 11 => invalid (negative)
# 70, 20, 30 => invalid (sum of 20 + 30 is less than 70)

# D:
# input: 3 integers (could also be array holding three integers)
# return: string (identifying triangle type or invalid entry)
# output: none

# A:
# - define method with 3 integer arguments

# - define validate_sides helper method (return boolean)
#   -pass in 3 arguements
#   -check that all args are > 0 AND
#   -sum of any 2 sides is greater than 3rd
#     -place into array
#       -sort array by size
#       -check that first 2 (smallest) elements are greater than third (largest)

# -if validate_sides return is false, return from method string: "Invalid input"
    
# - define control flow for identifying triangle type 
#   -place args into array
#   -set control flow structure (case statement)
#     -if unique array has a size of 1, return string "isoceles"
#     -if unique array has a size of 3, return string "scalene"
#     -else, return string 'equilateral'

# Notes: 
# created a working program based on instructions alone. Next:
#- check test cases to look for additional requirements
# -run tests
# compare to lesson pedac
# check solution solution
# read student submissions
# refactor

# C:

# def validate_sides(s1, s2, s3)
#   sorted_sides = [s1, s2, s3].sort
#   sum_test = sorted_sides[0] + sorted_sides[1] > sorted_sides[2]
  
#   s1 > 0 && s2 > 0 && s3 > 0 && sum_test
# end

# def triangle_type(s1, s2, s3)
#   validation = validate_sides(s1, s2, s3)
#   return "Input is not a valid triangle." unless validation

#   number_of_unique_sides = [s1, s2, s3].uniq.size

#   case number_of_unique_sides
#   when 3 then return "Scalene"
#   when 2 then return "Isoceles"
#   when 1 then return "Equilateral"
#   end
# end

# puts triangle_type(30, 30, 30)
# puts triangle_type(20, 20, 22)
# puts triangle_type(21, 22, 15)
# puts triangle_type(0, 3, 5 )
# puts triangle_type(12, -13, 11)
# puts triangle_type(70, 20, 30)


#refactored code:

# class Triangle
#   attr_reader :sides
  
#   def initialize(s1, s2, s3)
#     @sides = [s1.to_f, s2.to_f, s3.to_f]
#     raise ArgumentError unless valid_sides?
#   end

#   def type
#     number_of_unique_sides = @sides.uniq.size

#     case number_of_unique_sides
#     when 3 then return "Scalene"
#     when 2 then return "Isoceles"
#     when 1 then return "Equilateral"
#     end
#   end

#   private

#   def valid_sides?
#     sorted_sides = sides.sort
#     sum_test = (sorted_sides[0] + sorted_sides[1]) > sorted_sides[2]
  
#     sides.min > 0 && sum_test
#   end
# end


# 1.2
#P: identify the number of differences between two strings

#E: see testing page

#D: 
#input: 2 strings
#output: integer

#A:
#iterate from 0 to index index of shorter string
#set count to 0
#-use index reference to check if chars at both positions are the same
#if not same, increment count by 1
# return count

# other thoughts: 
#-how should case be handled?
#-is each DNA an object?


#before coding, checking provided etst cases
#test cases show testing 1 DNA object (instantiated with string)
# against the string passed into #hamming_distance method

# 1.3

#P:
# Write a program (assuming a class at this point?) that converts a number to its roman numeral

# rules: 


#thoughts: 
# try using divmod to chop off numbers for conversion?
# otherwise, could manually loop, dividing by 10 and chopping off numbers
# need some kind of key
#  -hash with basic roman elements?

#technically, the math for addition/substraction could be automated, but that would take 
# some work to think through the logic

#main roman numerals: 
# I
# II
# III
# IV
# V
# VI 
# VII
# VII
# IX

# main characters: 
# I => 1
# V => 5
# X => 10
# L => 50
# C => 100
# D => 500
# M => 1000

 
#E: see test case doc

# D:
# input: integer
# output: string (capital letters indicating roman numeral)

# A: 

# -create RomanNumeral class
#   -take 1 integer argument at instantiation
# -define #to_roman instance method that performs conversion and returns string

#implementation thoughts: 
  # -main question here is how to lay out the math needed to perform the conversation. 
  # -two considerations
  #   -how to add/subtract (based on greater than or less than 5) to create the correct number
  #   - how to keep track of the place value 


# test cases do not check input validation
# approach: 
# - take a few test cases and maually write out the logic flow that needs to happen

#input: 5

# notes: tried playing with div/divmod
# divmod chops off numbers as needed, but not sure how to keep track of the 
# place value of each number (ie, should a 5 be V(5) or L(50) or D(500))
  # could try using index position in an array of digits
  # could use overall size of array of digits to determine starting point


# testing with indices
# def roman_converter(int)
#   roman = []
#   digits = int.digits

#   digits.size.times do |idx|
#     puts digits[idx]
#     # perform conversion and #unshift to maintain correct order
#   end
# end

# p roman_converter(208)
# # don't think relying on index will work. Think need to rely on #divmod

# new thoughts:
# problem only needs to handle numbers up to 3000
# check size of input digit
  # if 4
    #- chop off first digit and perform string multiplication
    #-multiple the thousands place by 'M' -> will return either M(1000), MM(2000), or MMM(3000)

# First attempt: working program, only set to handle 4 digit numbers
#############################################################################################
# def to_roman(num)
#   num = num.digits.reverse
#   roman = ''

#   if num.size == 4
#     thousands = convert_to_thousands(num.first)
#     roman << thousands
#     num = num[1..-1]
#     hundreds = convert_to_hundreds(num.first)
#     roman << hundreds
#     num = num[1..-1]
#     tens = convert_to_tens(num.first)
#     roman << tens
#     num = num[1..-1]
#     ones = convert_to_ones(num.first)
#     roman << ones
#   end
#   roman
# end

# def convert_to_thousands(num)
#   'M' * num # should use constants for roman letters
# end

# def convert_to_hundreds(num)
#   case num 
#   when 0      then ''
#   when (1..3) then 'C' * num
#   when 4      then 'CD'
#   when 5      then 'D'
#   when (6..8) then 'D' + ('C' * (num - 5))
#   else             'MD'
#   end 
# end

# def convert_to_tens(num)
#   case num
#   when 0      then ''
#   when (1..3) then 'X' * num
#   when 4      then 'XL'
#   when 5      then 'L'
#   when (6..8) then 'L' + ('X' * (num - 5))
#   else             'XC'
#   end 
# end

# def convert_to_ones(num)
#   case num
#   when 0      then ''
#   when (1..3) then 'I' * num
#   when 4      then 'IV'
#   when 5      then 'V'
#   when (6..8) then 'V' + ('I' * (num - 5))
#   else             'IX'
#   end 
# end
###########################################################################################
# first fully working program. 
# 1. refactor be be oo with a RomanNumerals class
# 2. try to reduce the code complexity
    # - I think the individuals conversion emthods need to stay 
    # these have unique, step-based logic 
    # keep: 
      # -convert_to_thousands
      # -convert_to_hundreds
      # -convert_to_tens
      #-convert_to_ones
    # remove/refactor: 
    #-four_digit_converter, etc
      # these all have the same logic repeated over and over. 


# def to_roman(num)
#   num = num.digits.reverse

#   case num.size
#     when 4 then four_digit_converter(num)
#     when 3 then three_digit_converter(num)
#     when 2 then two_digit_converter(num)
#     else        one_digit_converter(num)
#   end

# end

# def four_digit_converter(num)
#   roman = ''
#   thousands = convert_to_thousands(num.first)
#   roman << thousands
#   num = num[1..-1]
#   hundreds = convert_to_hundreds(num.first)
#   roman << hundreds
#   num = num[1..-1]
#   tens = convert_to_tens(num.first)
#   roman << tens
#   num = num[1..-1]
#   ones = convert_to_ones(num.first)
#   roman << ones
#   roman
# end

# def three_digit_converter(num)
#   roman = ''
#   hundreds = convert_to_hundreds(num.first)
#   roman << hundreds
#   num = num[1..-1]
#   tens = convert_to_tens(num.first)
#   roman << tens
#   num = num[1..-1]
#   ones = convert_to_ones(num.first)
#   roman << ones
#   roman
# end

# def two_digit_converter(num)
#   roman = ''
#   tens = convert_to_tens(num.first)
#   roman << tens
#   num = num[1..-1]
#   ones = convert_to_ones(num.first)
#   roman << ones
#   roman
# end

# def one_digit_converter(num)
#   roman = ''
#   ones = convert_to_ones(num.first)
#   roman << ones
#   roman
# end

# def convert_to_thousands(num)
#   'M' * num # should use constants for roman letters
# end

# def convert_to_hundreds(num)
#   case num 
#   when 0      then ''
#   when (1..3) then 'C' * num
#   when 4      then 'CD'
#   when 5      then 'D'
#   when (6..8) then 'D' + ('C' * (num - 5))
#   else             'CM'
#   end 
# end

# def convert_to_tens(num)
#   case num
#   when 0      then ''
#   when (1..3) then 'X' * num
#   when 4      then 'XL'
#   when 5      then 'L'
#   when (6..8) then 'L' + ('X' * (num - 5))
#   else             'XC'
#   end 
# end

# def convert_to_ones(num)
#   case num
#   when 0      then ''
#   when (1..3) then 'I' * num
#   when 4      then 'IV'
#   when 5      then 'V'
#   when (6..8) then 'V' + ('I' * (num - 5))
#   else             'IX'
#   end 
# end

# ### NOTE: use rubocop and go back and test previous 2 solutions
# p to_roman(9) == 'IX'
# p to_roman(93) == 'XCIII'
# p to_roman(141) == 'CXLI'
# p to_roman(163) == 'CLXIII'
# p to_roman(402) == 'CDII'
# p to_roman(575) == 'DLXXV'

# p to_roman(911) == 'CMXI'
# p to_roman(1024) == 'MXXIV'
# p to_roman(3000) == 'MMM'

# all provided test cases past, but can't figure out how to refactor/ avoid
# the repeated logc currently happening. Solution pedac suggests the main steps of: 
# - Creating a roman numerals collection (associating numbers and key values) (DESCENDING order)
# - Iterating over that collection
# - adding the correct numerals to a string
# subtracting the current value **

# 1.4

# P:
# Write a program that take a word and a word list and returns a list of the words
# that are anagrams of the input word

# E: see test suit

# D:
# Anagram class
# -constructor method that takes 1 argument (target word)
# - #match instance method that takes 1 argument (array of words)
#    - selects and returns an array of anagrams

# input: string (target word) 
# return: array (of selected strings)

# A: 
# -define Anagram class
# -set constructor to take one arg (target word)
# -define match instance method with one argument (array of words)
# - select the words that are anagrams and return as array
# -convert input word to array of letters and sort
# - iterate over array of anagram words
# - for each word, (perform selection)
# --check that word, converted to characters and sorted, is the 
#      same as the input word AND word unsorted is NOT equal to input word

# rules: 
#- an identical word should NOT be considered an anagram
# -#match SHOULD be case INsensitive

# 1.5

# P: write a scrable program that assigns a numeric value to each letter and returns
# the word score of the input word

# rules: 
# - see assignment for score associated with each letter
#-nil, empty string, etc input should return a score of 0
# - should be case insensitive

# E: see test suite

# D: 
# class definition 
# constructor
#   -one arg (input word)
# instance method
# -return integer

# collection to associated letter with score
#   -hash with score as key and array of letters as value? OR array as key and score as value?

# A: 
# -define collection associating letters with scores
#  -make sure method returns a score of 0 if input is not a valid string
# -define Scrabble class with 2 instance methods
#   -constructor that takes 1 argument (word to be scored)
#     - save input word as @word
#   -#score instance method that scores word and returns integer
#    -perform transformation on input word
#    -upcase word 
#    -convert to array of letters
#    -iterate over each letter
#    -on each iteration, perform iteration over hash keys
#     -if current letter is included in current hash_array,
#         -use hash reference to access score
#         -use score as block return value for transformation
#   -add all integers and return result

# 1.6
# P:
# write a program that identifies whether a number's aliquout sum is perfect, abundant, or deficient
# ei, a program that:
#-finds all divisors of a number, 
#-sums them
#-compares sum to original number nad returns either perfect, abundant, or deficient
# perfect if sum is equal to original number
#-deficient if sum is less than original number
#- abundant if sum is greater than original number

#notes:  
#-prime numbers are alway deficient (irrelevant?)
#-assume target number exists as state in a custom class

#E: test suite notes: 

#D: 
# input: integer
# return: string (perfect, abundant, or deficient)
# custom class
# 2 instance methods: constructor and find_aliquot
# -maybe 3 instance emthods? one to find aliquot sum and another to determine type?

#rules: 
#contructor shuld raise StandardError if a number less than 1 is passed as arg
#do not count number when finding divisors
# that's all - only 4 test cases given 

# A:
#-define PerfectNumber class
#define constructor method to take 1 argument
# -raise StandardError if argument if <= 0
# -save valid argument to instance variable

#define instance method find_aliquot_sum
# -divide input number by 2 (midpoint)
# -iterate from 1 up to midpoint (set range, convert to array, perform selection)
#   - check if target number module current iterator equals 0
# (if performing selection, rely on boolean return to select current number)
# (alternatively, could initialize result array and push each number that evaluates to true)
# find and return sum of array (save as instance variable aliquot_sum)

#define classify instance method
#   - set up control flow comparing input number to aliquot sum
#   - if equal, return string "perfect" *** tests check for lowercase return strings!
# - if aliquot is less than number, return "deficient"
# else, return 'abundant'


##OMGG made the same error. this needs to be a class method, not an insstnace method. 
# so this functionality needs to happen in a class method, whcih changes alot. Refactoring below.

# New algorithm: 

#define PerfectNumber class
#define class method #classify to take one argument
#raise StandardError if input is less then 1
#grab logic from before
#split into 2 class method and call #find_aliquot(number) inside #classify

# class PerfectNumber
#   attr_reader :number

#   def initialize(number)
#     raise StandardError unless number > 0
#     @number = number
#     @aliquot_sum = self.find_aliquot
#   end

#   def classify
#     return 'perfect' if number == aliquot_sum
#     return 'deficient' if number > aliquot_sum
#     return 'abundant' if number < aliquot_sum
#   end

#   private

#   attr_reader :aliquot_sum

#   def find_aliquot
#     midpoint = number / 2
#     divisors = (1..midpoint).to_a.select do |current_num|
#       number % current_num == 0
#     end

#     @aliquot_sum = divisors.sum
#   end
# end

# num = PerfectNumber.new(12)
# p num.classify

# class PerfectNumber

#   def self.classify(number)
#     raise StandardError unless number > 0
#     aliquot_sum = find_aliquot(number)
#     return 'perfect' if number == aliquot_sum
#     return 'deficient' if number > aliquot_sum
#     return 'abundant' if number < aliquot_sum
#   end

#   def find_aliquot(number)
#     midpoint = number / 2
#     divisors = (1..midpoint).to_a.select do |current_num|
#       number % current_num == 0
#     end

#     divisors.sum
#   end
# end

## Note: 
# the private access control modifier only works on instance methods. 
# to make a class method private, we can use: 

# class << self

# private

# instance method here

# this allows us to operate on the class as an object. Thus, the "instance"
# method is actually a private class method. Technically, this is adding a private
# instance method to the class object


# 1.7

# P: 
# Write a program that takes an octal string number as input and converts it
# to a decimal number

# rules: 
#any non-octal string input should return zero
  #-strings with none-number chars
  #-strings containing numbers that are not octal
  #cotal conversaions are made right to left
  #ie, converting to integer and then array of digits would be left to right
  #for digit conversion, each digit is multilpied by an incremented number, beginning with 0

# E: see test suite
# -testing for some numbers to be "seen as invalid"

# D: 
#Octal custom class
# constructor with 1 arg
#to_decimal instance method

# for target method: 
#   input: string
#   return: integer

# A: 
#define Octal class and 2 instance methods
#-set contructor to take a string number
#-in to_decimal instance method: 
# -convert octal number to integer
# - convert integer to array of digits
# NO
  # - iterate from 0 up to one less than string octal number size
  # use
# Instead: 
# iterate over the digits array with index (performing transformation)
# each number: 10 to the power of its index and then times the current number (number * 10 ^ index)
# sum the return array of new digits and return integer




class Octal
  attr_reader :octal_num

  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 unless validate_input
    number_array = octal_num.to_i.digits

    result = number_array.map.with_index do |digit, index|
      p digit
      p index
      digit*8**index
    end
    result.sum
  end

  private

  def validate_input
    octal_num.to_i % 8 == 0 &&
    octal_num.to_i != 0 && 
    octal_num != '8'
  end

end

p Octal.new('0').to_decimal
p Octal.new('cat5').to_decimal
p Octal.new('8').to_decimal