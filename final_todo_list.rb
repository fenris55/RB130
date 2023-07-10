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

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? {|item| item.done? }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  # solution uses #mark_done_at
  def done!
    @todos.each_index {|index| mark_done_at(index) }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

 # from lesson solution
 # would delete all instances of a repeated entry
  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    text = "----#{title}----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each do |item|
      yield(item)
    end

    self 
  end

  def select
    new_list = TodoList.new("Selected Todos")

    each do |item| 
      new_list << item if yield(item) 
    end

    new_list
  end

  # def find_by_title(search_title)
  #   each do |item|
  #     return item if item.title.downcase == search_title.downcase # could downcase for better functionality
  #   end
  #   nil
  # end

  #lesson uses #select: 
  def find_by_title(title)
    select { |item| item.title == title }.first
  end

  def all_done
    select do |item| 
      item.done?
    end
  end

  def all_not_done
    select do |item| 
      !item.done?
    end
  end

  def mark_done(name)
    find_by_title && find_by_title(name).done! #first is to validate
  end

  def mark_all_done
    each do |item|
      item.done!
    end
  end

  def mark_all_undone
    each do |item|
      item.undone!
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
