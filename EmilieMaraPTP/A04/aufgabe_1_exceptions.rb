# Author:: MAra von Kroge, Emilie Schuller
# 25. November 2017
# TeamChallenger
# Klasse Queue inklusive Exception

class Queue
  def initiliaze
    @queue=Array.new
  end 
  
  def enqueue(element)
    if element == nil 
      begin
      raise ArgumentError.new("Please add a valid value!")
   #   enqueue(nil)
    rescue ArgumentError => enqueue
      puts "Here's the backtrace for this exception:"
      puts enqueue.backtrace
      puts "And here's the exception object's message:"
      puts enqueue.message
      ensure
    end
    @queue.push(element)
    end
  end
  
  def dequeue
 #   @queue=Array.new
    if @queue.size == 0
      raise ArgumentError.new("Sorry, this Queue is already empty, you can't remove any elements!")
    begin
    rescue ArgumentError => dequeue
      puts "Here's the backtrace for this exception:"
      puts dequeue.backtrace
      puts "And here's the exception object's message:"
      puts dequeue.message
    ensure
    end
    @queue.shift
    end
  end

  def peek
    if @queue.size == 0
      raise ArgumentError.new("Sorry, this Queue is empty!")
  begin
  rescue ArgumentError => peek
    puts "Here's the backtrace for this exception:"
    puts peek.backtrace
    puts "And here's the exception object's message:"
    puts peek.message
  ensure
  end
  @queue.first
    end
end

def size
  @queue.size
end

def to_s
  if @queue.size == 0
    raise ArgumentError.new("Sorry, this Queue is empty!")
   begin
   rescue ArgumentError => to_s
     puts "Here's the backtrace for this exception:"
     puts peek.backtrace
     puts "And here's the exception object's message:"
     puts peek.message
   ensure
   end
   @queue.first
end
end 

end