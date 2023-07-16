# 1.1

# class Tree
#   include Enumerable

#   def each
#     ###
#   end
# end

# p Tree.methods

# 1.2

# my solution:
# def compute
#   block_given? ? yield : "Does not compute."
# end

# lesson solution: 
# def compute
#   return "Does not compute." unless block_given?
#   yield
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

#challenge: 

# def compute(input)
#    block_given? ? yield(input) : "Does not compute."
# end

# p compute(4) { |num| num + 2 } == 6
# p compute('Rebecca') { |name| "Hi there, #{name}!" } == "Hi there, Rebecca!"
# p compute('apple') == "Does not compute."

#1.3

# def missing(array)
#   target_range = (array.first..array.last).to_a
#   new_array = []

#   target_range.each do |num|
#     new_array << num if !array.include?(num)
#   end

#   new_array
# end

#refactored based on student solutions: 
# def missing(arr)
#   (arr.first..arr.last).to_a - arr # can just subtract input array
# end

#lesson solution uses #Ennumerable#each_cons:

# def missing(arr)
#   result = []
#   arr.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

#challenge: original solution meets challenge requirements

#1.4
# def divisors(input_num)
#   result = []
#   1.upto(input_num).each do |num|
#     result << num if input_num % num == 0
#   end

#   result
# end

#lesson solution relies on #select instead: 
# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# further exploration: speed it up
# lesson hints that half the divisors give you the other half
# attempted to iterate to the halfway point and then just add the input number
# to the final array
# this solution works, but it doesn't cut down the time. 

# def divisors(number)
#   number_midpoint = number / 2

#   result = 1.upto(number_midpoint).select do |candidate|
#     number % candidate == 0
#   end

#   result << number
# end

# p divisors(999962000357)
# p divisors(1) == [1]
# p divisors(99400891)

#1.5
#my solution: 
# def decrypt_rot13(name)
#   lower_alphabet = ('a'..'z').to_a
#   upper_alphabet = ('A'..'Z').to_a

#   #opted to split into upp and lower to handle non-standard English capitalization, ie: ny-Xujnevmzv
#   result = name.chars.map.with_index do |letter, index|
#             if lower_alphabet.include?(letter)
#               selected_index = lower_alphabet.index(letter)
#               lower_alphabet[selected_index - 13]
#             elsif upper_alphabet.include?(letter)
#                selected_index = upper_alphabet.index(letter)
#                upper_alphabet[selected_index - 13]
#             else
#               letter
#             end
#           end

#  result.join
# end

# p decrypt_rot13("Nqn Ybirynpr")
# p decrypt_rot13("Tenpr Ubccre")
# p decrypt_rot13("Nqryr Tbyqfgvar")
# p decrypt_rot13("Nyna Ghevat")
# p decrypt_rot13("Puneyrf Onoontr")
# p decrypt_rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
# p decrypt_rot13("Wbua Ngnanfbss")
# p decrypt_rot13("Ybvf Unvog")
# p decrypt_rot13("Pynhqr Funaaba")
# p decrypt_rot13("Fgrir Wbof")
# p decrypt_rot13("Ovyy Tngrf")
# p decrypt_rot13("Gvz Orearef-Yrr")
# p decrypt_rot13("Fgrir Jbmavnx")
# p decrypt_rot13("Xbaenq Mhfr")
# p decrypt_rot13("Fve Nagbal Ubner")
# p decrypt_rot13("Zneiva Zvafxl")
# p decrypt_rot13("Lhxvuveb Zngfhzbgb")
# p decrypt_rot13("Unllvz Fybavzfxv")
# p decrypt_rot13("Tregehqr Oynapu")

# lesson solution: 
# ENCRYPTED_PIONEERS = [
#   "Nqn Ybirynpr",
#   "Tenpr Ubccre",
#   "Nqryr Tbyqfgvar",
#   "Nyna Ghevat",
#   "Puneyrf Onoontr",
#   "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
#   "Wbua Ngnanfbss",
#   "Ybvf Unvog",
#   "Pynhqr Funaaba",
#   "Fgrir Wbof",
#   "Ovyy Tngrf",
#   "Gvz Orearef-Yrr",
#   "Fgrir Jbmavnx",
#   "Xbaenq Mhfr",
#   "Fve Nagbal Ubner",
#   "Zneiva Zvafxl",
#   "Lhxvuveb Zngfhzbgb",
#   "Unllvz Fybavzfxv",
#   "Tregehqr Oynapu"
# ].freeze

# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else
#     encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each { |name| puts rot13(name) }

#1.6
#my solution: 
# def any?(array)
#   counter = 0
#   until counter == array.size
#    block_return = yield(array[counter])
#    return true if block_return
#    counter +=1 
#  end
#  false
# end

#could also rely on Array#each: 
# def any?(array)
#   array.each { |el| return true if yield(el) }
#   false
# end

#note: lesson solution takes second approach with #each

#further exploration: my second solution would also work with 
# hashes. My first would not, as it relies on indices, which hashes don't have

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

#1.7
# def all?(array)
#   return true if array.empty? #not necessary
#   array.each { |el| return false unless yield(el) }
#   true
# end

# #lesson solution is the same

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

# 1.8
# same as lesson solution
# def none?(array)
#   array.each { |el| return false if yield(el) }
#   true
# end

#lesson solution also povides alternative using the custom #any? defined above: 

# def any?(array)
#   array.each { |el| return true if yield(el) }
#   false
# end

# def none?(array, &block)
#   !any?(array, &block)
# end

# here, the block passed at invocation is being explicitly passed into #none? so that it can then be 
# passed to #any? (along with the array). It just flips the logic using !, outputting the opposite of any?
 
# NOTE: blocks aren't passed down the calling chain by default; &block must be explicitly passed as an 
# arugmetn to the calling method to that it can then b passed up the method chain

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# 1.9
# def one?(array)
#   one_counter = 0
#   array.each do |el|
#     one_counter += 1 if yield(el)
#     return false if one_counter > 1
#   end
#   one_counter == 1 ? true : false
# end

# p one?([1, 3, 5, 6]) { |value| value.even? } == true
# p one?([1, 3, 5, 7]) { |value| value.odd? }  == false
# p one?([2, 4, 6, 8]) { |value| value.even? } ==  false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p one?([1, 3, 5, 7]) { |value| true } == false
# p one?([1, 3, 5, 7]) { |value| false } == false
# p one?([]) { |value| true } ==  false

# 1.10
# def count(array)
#   counter = 0
#   array.each do |el|
#     counter += 1 if yield(el)
#   end
#   counter
# end

#further exploration: write the method and do not use #loop, #while, #until, #each, or #count

# solution using for:
# def count(array)
#   counter = 0
#   for i in array
#     counter += 1 if yield(i)
#   end
#   counter
# end

#alternative approach, but still relies on for
# def count(array)
#   counter = 0
#   truthy_els = array.select { |el| yield(el)}
  
#   for i in truthy_els do 
#     counter += 1
#   end

#   counter
# end

## oHH can use #size: 
# def count(array)
#   array.select { |el| yield(el)}.size
# end





p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2