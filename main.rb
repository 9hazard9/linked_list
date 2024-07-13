require_relative 'lb/linked_list.rb'
require_relative 'lb/node.rb'

list = LinkedList.new

list.append('maidenless')
list.append('two fingers')
list.append('tarnished')
list.prepend('let me solo her')
p list.size
p list.head
p list.tail
puts list.at(1)
list.pop
p list.contains?('tarnished')
p list.contains?('ranni the witch')
puts list.to_s


