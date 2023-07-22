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
# -define #to_roman instance method that performs conversion and retuns string

#implementation thoughts: 
  # -main question here is how to lay out the math needed to perform the conversation. 
  # -two considerations
  #   -how to add/subtract (based on greater than or less than 5) to create the correct number
  #   - how to keep track of the place value 


# test cases do not check input validation
# approach: 
# - take a few test cases and maually write out the logic flow that needs to happen


def roman_converter(int)
  int.divmod
end

puts roman_converter(5)
