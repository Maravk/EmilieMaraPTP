# Author:: emilie Schuller
# 06. Dezemeber 2017
# Deque-Klasse

class Deque
  def initialize
    @deque=Array.new
  end
  
  def add_first(element)
    @deque.unshift(element)
  end
  
  def add_last(element)
    @deque << element
    return self
  end
  
  def remove_first
      raise ArgumentError, "Das Deque ist bereits leer!" if @deque.size == 0
    @deque.pop
    return self
  end
  
  def remove_last
      raise ArgumentError, "Das Deque ist bereits leer!" if @deque.size == 0 
    @deque.delete_at(@deque.length-1)
    return self
  end
  
  def size
   return @deque.length
  end
  
  def empty?
   return @deque.empty?
  end
  
  def to_s
    puts "Das Deque sieht folgendermaßen aus: #{@deque.each {|line| puts line}}."
  end
  
end


emi=Deque.new
emi.add_first(1)
emi.add_first(2)
emi.add_last(10)
puts emi.add_last(2000)
puts emi.remove_first
puts emi.remove_last
puts emi.size
puts emi.empty?
puts emi.to_s