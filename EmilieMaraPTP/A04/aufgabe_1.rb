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
  @queue.push(element)
  return self 
  end
  
  # Methode für das Entfernen am Anfang
  def dequeue(element)
    @queue.delete(element)
    return self
  end
  
  # Methode für das Ausgeben des ersten Elementes.
  def peek
    @queue.first 
  end
  
  # Methode für die Länge der Queue.
  def size
    @queue.size
  end
  
  # Methode für das Ausgeben des Arrays.
  def to_s
    @queue.to_s
  end
  
  # Methode für Empty.
  def empty?
    @queue.empty?
  end
end 