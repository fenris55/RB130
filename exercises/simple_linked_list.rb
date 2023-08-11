# Element objects will be used by SimpleLinkedList class
# Coded by following lesson solution. It was much simpler than I expected
class Element
  attr_reader :datum, :next

  def initialize(datum, next_el = nil)
    @datum = datum
    @next = next_el
  end

  def tail?
    @next.nil?
  end
end

# Utilizing Element objects to track a linked list
class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = @head
    while current_elem
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def to_a
    result = []
    current_element = @head
    until current_element.nil?
      result.push(current_element.datum)
      current_element = current_element.next
    end
    result
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = @head
    until current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end
end
