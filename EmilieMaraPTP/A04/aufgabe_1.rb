# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Queue

# Klasse Queue wird erstellt.
class Queue
  def initialize
    
    # Neues Array wird erstellt.
    @queue=Array.new
  end
  
  # Methode für das Hinzufügen am Ende.
  def enqueue(element)
    raise ArgumentError, "You aren't allowed to add the Element nil, sorry!" unless element != nil 
    begin
      enqueue(nil)
    rescue ArgumentError => enqueue
   #   puts enqueue.backtrace
      puts enqueue.message
    ensure
    # Return self: Referenz des Objektes wird zurückgegeben, damit niemand 
    # die Queue kaputt machen kann.
  #  return self
  end
  end
  
  # Methode für das Entfernen am Anfang
  def dequeue
    raise ArgumentError, "This Queue already is empty!" if @queue.include?(nil)
    @queue.shift
    begin
      @queue.empty?(true)
    rescue ArgumentError => dequeue
  #    puts dequeue.backtrace
      puts dequeue.message
    ensure
    end
    return self
    end
  
  # Methode für das Ausgeben des ersten Elementes.
  def peek
    raise ArgumentError, "This Queue already is empty!" if @queue.include?(nil)
    @queue.first
    begin
      @queue.empty?(true)
    rescue ArgumentError => peek
  #    puts peek.backtrace
      puts peek.message
    ensure 
    end
  end
  
  # Methode für die Länge der Queue.
  def size
    @queue.size
  end
  
  # Methode für das Ausgeben des Arrays.
  def to_s
    raise ArgumentError, "This Queue already is empty!" if @queue.include?(nil)
    @queue.to_s
    begin
      @queue.empty?(true)
    rescue ArgumentError => to_s
   #   puts to_s.backtrace
      puts to_s.message
    ensure
    end
  end
  
  # Methode für Empty.
  def empty?
    @queue.empty?
  end
end 