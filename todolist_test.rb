require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    # @list.done! # note: solution relies on false and initial state of list
    # assert_equal(true, @list.done?)
    assert_equal(false, @list.done?)
  end

  def test_type_error_message
    #solution tests both string and integer
    assert_raises(TypeError) {@list << 'entering string to todo array'}
  end

  # def test_shovel_operator
  #   todo4 = Todo.new("Water plants")
  #   @list << todo4
  #   assert_equal(4, @list.size)
  # end

  #solution given: (doesn't rely on other custom methods)
  def test_shovel
    todo4 = Todo.new("Walk dog")
    @list << todo4 # testing TodoList#<<
    @todos << todo4 # using Array#<<
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("Walk dog")
    @list.add(todo4)
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(7) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(9)}
    @list.mark_done_at(1)
    # assert_equal([@todo1], @list.all_done.to_a)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(9)}
    # @list.mark_all_done -> solution is not relying on untested instance methods
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)
    
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?) # also verifying the Todo instance method returns true
  end

  def test_remove_at
    assert_raises(IndexError) {@list.remove_at(18)}
    assert_equal(@todo3, @list.remove_at(2))
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_todo_marked_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0) # solutions groups these together
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_all_marked_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    # my solution: 
    # assert_equal(false, @todo1.done?)
    # assert_equal(false, @todo3.done?)
    # @list.done! #this calls the Todo#each method
    # assert_equal(true, @todo1.done?) #true returns here show iteration is working
    # assert_equal(true, @todo3.done?)

    #lesson solution creates new array and uses Todo#each to populate it: 
    # testing method functionailty separate from other methods/instances
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_equal_return_value
    # my solution: 
    # test_array = []
    # return_value = @list.each { |todo| test_array << todo }
    # assert_equal(@list, return_value)

    #lesson solution simplifies this: 
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    # test_list = TodoList.new("Selected Todos")
    # test_list << Todo.new("Buy milk")
    # test_list.mark_done_at(0)

    # @list.mark_done_at(0)
    # assert_equal(test_list, @list.select { |todo| todo.done? })
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done?}.to_s)
  end

  #################### Extra Tests

  def test_verify_todo
    new_todo = 'Not a Todo object'
    assert_equal(false, @list.verify_todo(new_todo))
  end

  def test_find_by_title
    assert_equal(@todo3, @list.find_by_title("Go to gym"))
  end

  def test_all_done
    @todo1.done!
    @todo3.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo3)

    assert_equal(list.to_s, @list.all_done.to_s) 
    # this and test_select rely on TodoList#to_s output because there's no TodoList#== to directly compare objects
  end

  def test_all_not_done
    @todo1.done!
    @todo3.done!
    list = TodoList.new(@list.title)
    list.add(@todo2)

    assert_equal(list.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done
    @list.mark_done("Clean room")
    assert_equal(true, @todo2.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  #don't love this test -- too complex. 
  def test_mark_all_undone
    @list.done!
    assert_equal(true, @list.done?)
    @list.mark_all_undone
    assert_equal(TodoList.new(@list.title).to_s, @list.all_done.to_s)
  end
end