# example ignoring block: 

# def some_method
#   "I'm a method ignoring the block."
# end

# p  some_method { "I'm an ignored block"}

# example of passing implicit block
# def some_method
#   yield
# end

# p  some_method { "I'm an implicit block"}


#example of making a block mandatory: 


## 2 use cases for blocks: (implementation details and snadwich code)

#implementation 1:
# [1, 2, 3, 4].each { |num| puts num}

#implementation 2:
# total = 0
# [1, 2, 3, 4].each { |num| total += num }
# p total

# sandwich code example: 
# def sandwich_code_example(number)
#   p Time.now
#   yield(number)
#   p Time.now
# end

# sandwich_code_example(100) { |num| puts num }

#strict arity: 

#with method: 
# def method_requiring_one_argument(string)
#   p string
# end

# method_requiring_one_argument #raises an ArgumentError
# method_requiring_one_argument(7) # executes correctly

#with lambda: 
# test_lambda = lambda { |mandatory_argument| puts mandatory_argument}
# # test_lambda.call #raises an ArgumentError
# test_lambda.call("Strict arity means I demand an argument to match my parameter!")

#lenient arity: 
# with block:
# def method_showing_lenient_arity(arg)
#   yield
# end

# method_showing_lenient_arity(7) { |no_argument_required| p no_argument_required }

# def method_showing_lenient_arity(arg)
#   yield(arg, 'extra arg is ignored!')
# end

# method_showing_lenient_arity(7) { |no_argument_required| p no_argument_required }

# with proc: 

# example_proc = proc { |arg1, arg2| "#{arg1} and #{arg2}" }
# p example_proc.call("apple")

# example_proc = proc { |arg1, arg2| "#{arg1} and #{arg2}" }
# p example_proc.call("apple", "banana", "mango")

#example of returning a closrue from a method: 
# def closure_method
#   number = 100
#   Proc.new { number -= 10}
# end

# proc1 = closure_method
# proc2 = closure_method

# p proc1.call #returns 90
# p proc1.call # returns 80
# p proc1.call # returns 70
# p proc1.call # returns 60

# p proc2.call # returns 90 -> this proc references a different copy of the method local variable `number`

# arr = [1, 2, 3, 4, 5]

# p arr.map(&:to_s) # specifically `&:to_s`

# def call_this
#   yield(2)
# end

# to_s = proc { |arg| arg.to_i }
# to_i = proc { |arg| arg.to_s }

# p call_this(&to_s) # => returns 2
# p call_this(&to_i) # => returns "2"

# def block_method(animal)
#   yield(animal)
# end

# block_method('turtle') { puts "This is a #{animal}."}

# example of binding: 
# def some_method(proc1)
#   proc1.call
# end

# kate = "I exist in the main scope!"
# proc1 = proc { puts "#{kate}" }
# some_method(proc1)

#example of reassignment reflected in binding: 
# def some_method(proc1)
#   proc1.call
# end

# kate = "I exist in the main scope!"
# proc1 = proc { puts "#{kate}" }
# kate = "A closure's binding reflects reassignment!"
# some_method(proc1)

# def some_method(proc1)
#   proc1.call
# end

# proc1 = proc { puts "#{kate}" }
# kate = "I'm not part of proc1's binding!"

# some_method(proc1)

#example of yielding to block: 
# def message
#     yield
# end

# message { puts "hi" }

# def message(text)
#     yield(text)
# end

# greeting = "Hey there!"
# message(greeting) { |arg| puts arg }

# def message(text)
#     yield(text)
#     puts "hello from the method!"
# end

# greeting = "Hello from the block!"
# message(greeting) { |arg| puts arg }

# def message(text)
#     block_return_value = yield(text)
#     block_return_value + '!'
# end

# greeting = "Howdy"
# puts message(greeting) { |arg| arg.upcase}



#example of passing a block to another method: 
# def method2(block)
#  block.call if block_given?
#   puts 'hi'
# end

# def method1(&block)
#   method2(block)
# end


# method1 #{ puts "I was passed to method 2!"}

# def some(block)
#   yield
# end

# bloc = proc { p "hi" } # do not alter

# some(bloc) { p 'hi'}

# def block_method(&block)
#   block_given? ? "there's a block" : "no block given!"
# end

# p block_method # { "block!"}

# def retained_array
#   arr = []
#   Proc.new do |el|
#     arr << el
#     arr
#   end
# end

# arr = retained_array
# arr.call('one')
# arr.call('two')
# p arr.call('three')

# def lambda_return
#   puts "Before lambda call."
#   lambda {return}.call
#   puts "After lambda call."
# end

# def proc_return
#   puts "Before proc call."
#   proc {return}.call
#   puts "After proc call."
# end

# lambda_return #=> "Before lambda call."
#               #=> "After lambda call."

# proc_return #=> "Before proc call."


# def method_showing_lenient_arity(arg)
#    yield
#  end

# method_showing_lenient_arity(7) { |no_argument_required| puts "Block argument: #{no_argument_required}" }

# def second_method(block)
#   block.call
# end

# def first_method(&block)
#   second_method(block)
# end

# first_method { puts "I'll be converted to a proc!"}


