require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head
      find_tail.next_node = Node.new(value) 
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    if @head
      @head = Node.new(value, @head)
    else
      @head = Node.new(value)
    end
  end

  def size(node = @head, sum = 1)
    return 0 if node.nil?
    return sum if node.next_node.nil?

    size(node.next_node, sum + 1)
  end

  def head
    previous_head = @head
    @head = @head.next_node
    previous_head.next_node = nil
    return previous_head
  end
  
  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, node = @head, counter = 0)
    return node if index == counter
    return nil if node.next_node.nil?
    
    at(index, node.next_node, counter + 1)
  end

  def pop(node = @head)
    return node.next_node = nil if node.next_node.nil?

    pop(node.next_node)
  end

  def contains?(value, node = @head)
    return true if value == node.value
    return false if node.next_node.nil?

    contains?(value, node.next_node)
  end

  def find(value, node = @head, index = 0)
    return index if value == node.value
    return nil if node.next_node.nil?

    find(value, node.next_node, index + 1)
  end

  def to_s(node = @head, string = '')
    return string += "( #{node.value} ) -> nil" if node.next_node.nil?

    string += "( #{node.value} ) -> "
    to_s(node.next_node, string)
  end
  
  def find_tail
    node = @head
    
    return node if !node.next_node
    return node if !node.next_node while (node = node.next_node)
  end
end