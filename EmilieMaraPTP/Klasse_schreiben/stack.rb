# Author:: Emilie Schuller
# 07. januar 2017
# Stack

class Stack
  def initialize()
    @stack = []
  end
  
  def push(element)
    @stack << element
    return self
  end
  
  def pop
    @stack.shift
    return self
  end
  
  def peek
    @stack.last
    raise EmptyStackError, "This Stack is already empty!" if @stack.length == 0
  end
  
  def empty?
    @stack.empty?
  end
end

emi = Stack.new
emi.push(1)
emi.push(2)
emi.pop
emi.peek
emi.empty?