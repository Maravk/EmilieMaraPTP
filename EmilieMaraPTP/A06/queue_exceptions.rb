  # Author:: Mara von Kroge, Emilie Schuller
  # 25. November 2017
  # TeamChallenger
  # Klasse Queue inklusive Exception
  
  class Queue
    def initialize
      @queue=Array.new
    end 
    
        # Element hinzufügen
    def enqueue(element)
      if element == nil 
        raise IOError("Please add a valid value!")
      end
      @queue.push(element)
      end
  
        # Element am Ende entfernen.
    def dequeue
      if @queue.length == 0
        raise IndexError("Sorry, this Queue is already empty, you can't remove any elements!")
      end
      @queue.shift
    end
  
        # Erstes Element
    def peek
      if @queue.length == 0
        raise IndexError("Sorry, this Queue is empty!")
    end
    @queue.first
      end
  
      # Länge der Queue
  def length
    @queue.length
  end
  
      # To_s
  def to_s
    if @queue.length == 0
      raise IndexError("Sorry, this Queue is empty!")
    end
     @queue.first
  end
  
      # Empty? 
  def empty?
    return @queue.empty?
  end
end 