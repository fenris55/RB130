# 1.1

# Range#step return the calling range
# So, the custom #step should return...
  # - the input values converted to a range (since techincally we're creating a range during implementation) 
  # OR
  # - an array(?) holding the first 2 arguments (start and end value)

  # def step(start_num, end_num, step_size)
  #   target_num = start_num
  #   start_num.upto(end_num) do |number|
  #     if target_num == number
  #       yield(target_num)
  #       target_num += step_size
  #     end
  #   end
  #   #currently returns start_num (caller) -- not sure what the appropriate equivalent is. 
  #   # opting to leave as-is, since this most accurately reflects the Range#step functionality
  #   # Range#step returns the calling opject, and so does this implementation
  # end

  # p step(1, 10, 3) { |value| puts "value = #{value}" }

#1.2

# def zip(arr1, arr2)
#   counter = 0
#   new_arr = []
#   until counter == arr1.size
#     new_arr << [arr1[counter], arr2[counter]]
#     counter += 1
#   end
#   new_arr
# end


# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# 1.3
# def map(arr)
#   arr.each_with_object([]) do |el, new_arr|
#     new_arr << yield(el)
#   end
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 1.4
#tried 2 different approaches

# def count(*args)
#   counter = 0
#   args.each { |arg| counter += 1 if yield(arg) }
#   counter
# end

# def count(*args)
#   args.each_with_object([]) do |arg, new_arr|
#     new_arr << arg if yield(arg)
#   end.size
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# 1.5
#cannot make this approach work with a ternary
# def drop_while(arr)
#   arr.each_with_index do |el, index|
#     if yield(el)
#       next 
#     else 
#       return arr.slice(index, arr.size - index)
#     end
#   end
#   []
# end

# def drop_while(arr)
#   arr.each_with_index do |el, index|
#     # return arr.slice(index, arr.size - index) if !yield(el) #both lines work
#     return arr[index..-1] if !yield(el)
#   end
#   []
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

# 1.6

# def each_with_index(arr)
#   counter = 0
#   until counter == arr.size
#     yield(arr[counter], counter)
#     counter += 1
#   end
# end

# lesson solution uses counter with #each: 
# def each_with_index(arr)
#   index = 0
#   arr.each do |el|
#     yield(el, index)
#     index += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 1.7
# def each_with_object(arr, collection)
#   arr.each { |el| yield(el, collection) }
#   collection
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

#1.8

#this works but I using #sort_by doesn't meet the requirements
# def max_by(arr)
#   return nil if arr.empty?
#   block_returns = {}
#   arr.each do |el|
#     block_returns[el] = yield(el)
#   end
#  block_returns.sort_by {|k, v| v }.last.first
# end

#works correctly but feels messy
# lesson solution takes same approach, but skipps the unneccesary first 
# iteration by iteration over the slice arr[1..-1]
# def max_by(arr)
#   return nil if arr.empty?

#   arr_el = arr.first
#   block_return = yield(arr.first)

#   arr.each do |el|
#     if yield(el) > block_return
#       arr_el = el
#       block_return = yield(el)
#     end
#   end
# arr_el
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# 1.9
# this works; surprised the array format is finding to the block parameters correctly
# def each_cons(arr)
# (0..arr.size-2).each do |index|
#   yield(arr[index, 2])
# end
#   return nil
# end

# def each_cons(arr)
# (0..arr.size-2).each do |index|
#   yield(arr[index], arr[index + 1]) # same as above but broke up this array
# end
#   return nil
# end


# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

# 1.10 
#update the above method to take arguemnt specifying number of cons args

#first solution adapts to this easily: 

# def each_cons(arr, size)
# (0..arr.size-size).each do |index|
#   size > 1 ? yield(arr[index, size]) : yield(arr[index])
# end
#   return nil
# end

# can avoid ternary by just using the splat operator when yielding:
# def each_cons(arr, size)
# (0..arr.size-size).each do |index|
#   yield(*arr[index, size]) 
# end
#   return nil
# end


# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash == {}