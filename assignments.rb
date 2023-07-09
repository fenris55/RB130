# my solution:

# def select(array)
#   counter = 0
#   new_array = []

#   while counter < array.size
#     block_return = yield(array[counter])
#     new_array << array[counter] if block_return
#     counter +=1
#   end

#   new_array
# end

#lesson solution
# def select(array)
#   counter = 0
#   new_array = []

#   while counter < array.size
#     current_element = array[counter]
#     new_array << current_element if yield(current_element) #place yield in the conditional
#     counter +=1
#   end

#   new_array
# end

#array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

### Build a #reduce methodi
#my solution - starts counter at 0 if second argument is passed in,
#else sets counter to 1 if default is relied on (first array element)

# def reduce(array, default=array[0])
#   default == array.first ? counter = 1 : counter = 0

#   while counter < array.size
#     block_return = yield(default, array[counter])
#     default = block_return
#     counter += 1
#   end

#   block_return
# end

#lesson solution:
# see added test case below: provided solution doesn't work with multiplication
# (everything gets multiplied by 0 and then 0 is returned)

# def reduce(array, default=0)
#   counter = 0
#   accumulator = default

#   while counter < array.size
#     accumulator = yield(accumulator, array[counter])
#     counter +=1
#   end

#   accumulator
# end

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc * num }      #my example   # => 120 or 0?
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

#challenge: extend functionality to work with a non-number default
# my solution already achieves this
# issue with this implementation: if default value happens to be the same
# as the first array element, iteration will be thrown off


## This one works fully for both rounds of test cases.Handle the scenario
# passed in default having the same value as the first array element

# def reduce(array, default=nil)
#   if default == nil
#     counter = 1
#     default = array.first
#   else
#     counter = 0
#   end

#   while counter < array.size
#     block_return = yield(default, array[counter])
#     default = block_return
#     counter += 1
#   end

#   block_return
# end

# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
# # re-checking test cases from original problem:
# array = [1, 2, 3, 4, 5]
# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


# ToDo List:

