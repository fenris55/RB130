# 1.1

# P:
# create a new enumerator object that can iterate over an infinite list
# of factorials

# rules: 
# -when creating new enumerator, define what values are iterated on (here, factorials)
# -print first 7 factorials
# - then, try printing 3 more factorials
# - reset enumerator using #rewind
# - finally, print 7 more factorials


# notes: 
# - exercise in external iteration
# - only 3 methods will be needed
# - make use of Enumerator module

# E: N/A

# D:
# - new enumerator object
# - 3 custom methods

# Scratchpad:

# taken from docs: 
# note: this example can produce an infinite list of fibonacci numbers
#need to mirror this functionality, but set the code in the block to instead 
# produce an infinite list of factorials

#so, 3 methods means 3 method calls, not definitions. these are: 
# 1. #new
# 2. #take() -> use to id how many factorial to output (7 then 3 then 7 more)
# 3. #rewind


# fib = Enumerator.new do |y|
#   a = b = 1
#   loop do
#     y << a
#     a, b = b, a + b
#   end
# end

# fib.take(10) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# A: 
# did not implement the external iteration. Copying lesson solution below: 

# fact = Enumerator.new do |y|
#   a = 1
#   b = 1
#   #y << a
#  # puts a
#    loop do
#       result = (a..b).to_a.reduce { |total, num| total *= num }
#       y << result 
#   #    puts result
#       b += 1
#     end # end of loop
# end # end of block

# p fact.next
# p fact.next
# p fact.next
# p fact.next
# fact.produce
# fact.take(7)
# fact.take(3) # returns array, so iteration starts over instead of continuing
# p fact.rewind
# p fact.take(7)

#lesson solution: 

# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do 
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1
#   end
# end

#external iterators: 
# 6.times { |number| puts "#{number}! == #{factorial.next}" } # printing first 7
# 6.times { |number| puts "#{number}! == #{factorial.next}" } # printing next 3; number resets but factorial does not
# factorial.rewind # resetting enumerator
# 6.times { |number| puts "#{number}! == #{factorial.next}" }

#internal iterators: 
# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end

# note: not sure why solution prints 6 both times instead of 7-3-7 as in instructions


# 1.2





