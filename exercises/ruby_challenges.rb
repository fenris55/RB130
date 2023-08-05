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

# 1.8

# P: 
# write a program that takes a target number and a list of an unknown number of other numbers
# (use 3 and 5 as default values if no set is given). select all numbers that are multiples of
# the target number and return their sum

# rules: 
# -only check for multiple if list number is less than target number
# -list will include unknown number of values (and from phrasing, some may be higher 
#   than target number)

# # E: 

# # D: 
# SumOfMultiples class
# -constructor method (3 and 5 as fault arguments; else unknown number of integer arguments)
# -#to instance method (target number as argument)
# -instance variable referencing list of numbers

# A: 
# NOPENOPENOPE
# define class
# define constructor to take unknown number of arguments (default value should be array holding 3 and 5)
# save arguments to @number_list instance variable
# define getter method for list
# define #to instance method with one argument (target_number)
# define empty result array OR initialize result to 0 and increment
# -iterate over number_list array
#   -check that current number is less than target number AND target number
#   module current number equals zero
#     -if true add to array/increment result
#     -return result OR sum result array and return

# CORRECT A:
#tired and read the instructions wrong
#need to iterate from 1 up to one less than the target number and find the sum of all
# numbers that are multiples of the list numbers (with defaults 3 and 5)
#ALSO need both a class number and an instance number
#note: the test suite uses NO list arguments (ie relies on defaults 3 and 5) for the class method,
#while all tests for the instance method have an input list (meaning that there is no test to  
# see if 3,5 is used as a default for the instance method. But that's not indicated by the instructions)

# Note: opted to increment the result instead of saving multiples to a collection and then summing
# this eliminates an extra step, and is the approach used in the previous solution
# however, this solution notes that it would be better to save the multiples to a collection
# first => "two iterations are better than one"

# C: 
# class SumOfMultiples
#   attr_reader :number_list

#   def initialize(*list)
#     list = [3, 5] if list.empty?
#     @number_list = list
#   end

#   def to(target_number)
#     result = 0
#     (1...target_number).each do |current_num|
#       if number_list.any? { |list_num| current_num % list_num == 0 }
#         result +=current_num
#       end
#     end
#     result
#   end

#   def self.to(target_num)
#     SumOfMultiples.new.to(target_num)
#   end
# end

# p SumOfMultiples.new(43, 47).to(10_000)

# 1.9

# P: write a program that returns the lyrics of one round of the beer song, starting
# with the number passed in as an argument

# E: see test suite

# D: 
# BeerSong class
# 3 class methods
  # -#lyrics -> returns entire song (separate verse at 0)
  # -#verse -> takes one arg, prints 1 verse (0 should print final verse)
  # -#verses -> takes 2 args as start and end -> prints all verses between args, inclusive
  # -helper: final verse helper method - maybe no

# A:
# define BeerSong class
# define verse method
#   -if input is 0, return final verse
#     else
#   -return string of single verse with arg number interpolated
#   -and then decremented by 1
# define verses method
#  -initialize loop
#  -call verse method
#  -decrement arg by 1
#  -repeat until number is less than second arg
#  -(should default to final verse if number hits 0)
# define lyrics method
#  -call verses with arguemetns 99 and 0

#edge cases: 
# -handle issues with single/plural/no more when arg is 1 and 2
# -need a newline between verses

#Thoughts: wondering if this will fail test cases because of the interpolation
# i think not, since the String#==should check for (return) value equality

# C: 
# class BeerSong
#   def self.verse(number)
#     if number == 0
#       "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     else
#       "#{number} bottle#{number == 1 ? '' : "s"} of beer on the wall, " \
#       "#{number} bottle#{number == 1 ? '' : "s"} of beer.\n" \
#        "Take one down and pass it around, " \
#       "#{number.pred == 0 ? "no more" : number.pred} " \
#       "bottle#{number.pred == 1 ? '' : "s"} of beer on the wall.\n"
#      end
#   end

  # def self.verses(start_number, end_number)
  #   counter = start_number
  #   result = []
  #     loop do
  #       break if counter < end_number
  #         result << self.verse(counter) #maybe could also interpolate this and then add double newline, push to string instead
  #         result << ' '
  #         counter -= 1
  #     end
  #     puts result #since there's no output, storing all generating strings
  # end

#   def self.verses(start_number, end_number)
#     counter = start_number
#     result = ""
#       loop do
        
#           result << "#{self.verse(counter)}" #maybe could also interpolate this and then add double newline, push to string instead
#           counter -= 1
#           break if counter < end_number
#           result <<  "\n" \
          
#       end
#       result #since there's no output, storing all generating strings
#   end

#   def self.lyrics
#     self.verses(99, 00)
#   end
# end

#1.10

# P: 
# write a program that takes a string number and a target number and returns all consectutuve substrings
# that are the length of the target number

# rules: 
# if the target number is greater than the digit string length, raise an ArgumentError

# E:
# see test suite

# D:
# Series class
#   -constructor method that takes string number as argument
#   -#slices instance method that takes an integer argument and returns a 
#     collection 
#   -for each substring taken from input number, the substring should be
#   split into individuals integers, each of which is an (ordered) subarray element 

# A:

# define class
# define constructer with one arg
# -assign string number to instance variable
# define #slices instance method to take one integer arg
# -raise ArgumentError if slices argument is greater than string number length
# -initialize empty result array
# -iterate from index 0 up to string size minus integer
#   - take a substring slice starting at current index with a length of integer
#   - reverse string, convert to integer, convert to array of integers, push to result array
#   -return result array

#NOTES: forgot to handle 0s 
# C:
# class Series
#   attr_reader :string_number

#   def initialize(string_number)
#     @string_number = string_number
#   end

#   def slices(length)
#     raise ArgumentError if length > string_number.length
#     result = []
#     end_point = string_number.length - length
#     (0..end_point).each do |index|
#       substring = string_number[index, length]
#       sub_array = []
#       substring.each_char do |num|
#         sub_array << num.to_i
#       end
#       result << sub_array
#     end
#     result
#   end
# end

# refactoring: this mehtod is doing too much. splitting it up 
# maybe code is simplifier, but much longer and doesn't seem nay easier to read.
# complexity should be reduced through
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

# from lesson solution: 

# class Series
#   attr_reader :number_string

#   def initialize(str)
#     @number_string = str
#   end

#   def slices(length)
#     raise ArgumentError if length > number_string.length
#     number_string.chars.map(&:to_i).each_cons(length).to_a
#   end
# end

# s = Series.new('31001')
# # p s.string_number.length
# p s.slices(3)

## Medium Challenges
# 1.1

# P:
# write a method that prints a diamond out of consecutive alphabet letters

# rules:
# -diamond should start and end with a single A
# -diamond should be incremented by a consecutive odd number of spaces
#   (1, 3, 5 etc spaces)
# -letters should increment up to input letter and decrement back down to A

# make_diamond rules: 
# - every line should end with a newline
# - input of A should return just an A with newline
# - tests have no edge cases and no input validation


# E: 

# D: 
# -Diamond class
# -make_diamond CLASS method w/ 1 argument (letter)
#   -array/range of letters? or use ASCII values


# A: 
# -define Diamond class
# -define make_diamond class method with 1 letter argument
# -define range A-Z and convert to array
# -if input is A
#   -return "A\n"
# -find index of input letter, add 1, divide by 2 (max_spaces)
# -set heredoc
# -thoughts: can rely on how puts works with array to produce newline, 
# and add each line to an array

# -create string multiplying ' ' by max_spaces, A, ' ' by max_spaces
# -repeat at end of heredoc

# -iterate over alphabet range from 1 upto letter index
# -set space_size to 1 
# -interpolate letter at index 
# -interpolate ' ' * space_size
# -interpolate letter at index
# -reassign space_size to space + 2
# -repeat until target letter

# reverse: 
# -increment from letter index down to 1
# -interpolate letter at index 
# -interpolate ' ' * space_size
# -interpolate letter at index
# -reassign space_size to space - 2

class Diamond
  LETTERS = ('A'..'Z').to_a
  
  def self.inner_spaces(num)
    if num == 1 
      num
    else 
      num + num.pred
    end
  end

  def self.make_diamond(letter)
  return "A\n" if letter == LETTERS.first
  total_spaces = LETTERS.index(letter) 
  
  result = ""
  result << "#{" " * total_spaces}A#{" " * total_spaces}\n"


  1.upto(LETTERS.index(letter)) do |idx|
    buffer = LETTERS.index(letter) - idx
   result << "#{" " * buffer}#{LETTERS[idx]}#{" " * inner_spaces(idx)}#{LETTERS[idx]}#{" " * buffer}\n"
  end

  (LETTERS.index(letter) - 1).downto(1) do |idx|
   buffer = LETTERS.index(letter) - idx
   result << "#{" " * buffer}#{LETTERS[idx]}#{" " * inner_spaces(idx)}#{LETTERS[idx]}#{" " * buffer}\n"
  end

  result << "#{" " * total_spaces}A#{" " * total_spaces}\n"
  result
  end
end

puts Diamond.make_diamond('E')
