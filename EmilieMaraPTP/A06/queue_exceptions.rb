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
      raise TypeError.new("Please add a valid value!")
    else
    @queue.push(element)
    return self
    end
  end

      # Element am Ende entfernen.
  def dequeue
    if @queue.length == 0
      raise IndexError.new("Sorry, this Queue is already empty, you can't remove any elements!")
    else
      @queue.shift
      return self
    end
  end

      # Erstes Element
  def peek
    if @queue.length == 0
      raise TypeError.new("Sorry, this Queue is empty!")
    else
    @queue.first
    end
  end

    # Länge der Queue
  def length
    @queue.length
  end
  
      # To_s
  def to_s
    if @queue.length == 0
      raise IndexError.new("Sorry, this Queue is empty!")
    else
      @queue.to_s
    end
  end

    # Empty? 
  def empty?
    return @queue.empty?
  end
end 