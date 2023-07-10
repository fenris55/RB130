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

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ''

  attr_accessor :title, :description, :done

  def initialize(title, description='') 
      @title = title
      @description = description
      @done = false
  end

  def done!
      self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.title &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # def add(new_item)
  #   raise TypeError, "Can only add Todo objects" unless verify_todo(new_item) #not working?
  #   @todos << new_item 
  # end

  #lesson solution: 

  def <<(item)
    raise TypeError, 'can only add todo objects' unless item.instance_of? Todo 
    @todos << item
  end
  alias_method :add, :<<


  def verify_todo(new_item)
    new_item.class == Todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  # NOPE - > should return new array of todo objects (see below)
  # def to_a
  #   @todos.map { |item| item.title }
  # end

  # solution uses #clone so original array is not exposed
  def to_a
    @todos.clone
  end

  def done?
    @todos.all? {|item| item.done? }
  end

  #solution uses #fetch to automatically raise an IndexError
  def item_at(index)
    raise IndexError if @todos[index].nil? #solution uses #fetch to automatically raise an IndexError
    @todos[index]
  end

  #solution uses item_at custom method, with IndexError built in
  def mark_done_at(index)
    raise IndexError if @todos[index].nil?
    @todos[index].done!
  end

  #same - should have relied on #item_at
  def mark_undone_at(index)
    raise IndexError if @todos[index].nil?
    @todos[index].undone!
  end

  # solution uses #mark_done_at
  def done!
    @todos.each {|item| item.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  # same - relies on previously defined methods 
  def remove_at(index)
    raise IndexError if @todos[index].nil?
    @todos.delete_at(index)
  end

  # not working correctly  -> see below
  # def to_s
  #   puts "----#{title}----"
  #   @todos.each {|item| puts item}
  # end

  def to_s
    text = "----#{title}----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

 # this is working but not sure why
 # it's passing the entire array as an argument to the block
 # but output looks correct 
  # def each
  #   yield(@todos)
  #   @todos
  # end

  def each
    @todos.each do |item|
      yield(item)
    end

    self # updated to return caller instead of @todos
  end

  # select option 1
  # def select
  #   @todos.select do |item|
  #     yield(item)
  #   end
  # end

  #select option 2
  # def select
  #   selected_todos = []
  #   @todos.each do |item|
  #     block_return = yield(item)
  #     selected_todos << item if block_return
  #   end

  #   selected_todos
  # end

  #select option 3 (from lesson solution)
#   def select
#     selected = []
#     each do |item| #invoking the custom #each to yield to block  
#       selected << item if yield(item) 
#     end
#     selected
#   end

# select that returns a new TodoList object
  def select
    new_list = TodoList.new("Selected Todos")

    each do |item| #invoking the custom #each to yield to block  
      new_list << item if yield(item) 
    end

    new_list
  end
end

# two issues: (fixed)
# 1. to_s multiline output - same issue as on assessment
# 2. something wrong with TypeError message in #add   

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

# todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect # => [#<Todo:0x007fd88c0ad9f0 @title="Buy milk", @description="", @done=true>]

p (list.each do |todo|
  puts todo               # calls Todo#to_s; updated to return caller instead of array
end)

# list.each do |todo|
#   todo.title.upcase!     # demonstrating that the todo objects can still be mutated              
# end


