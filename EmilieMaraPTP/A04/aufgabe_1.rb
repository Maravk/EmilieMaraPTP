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
    # Return self: Referenz des Objektes wird zurückgegeben, damit niemand 
    # die Queue kaputt machen kann.
    return self
  end
  
  # Methode für das Entfernen am Anfang.y 
  def dequeue
    if @queue.empty?
      puts "Fehler, die Queue ist leer!"
    else
    @queue.shift
    end
    return self
  end
  
  # Methode für das Ausgeben des ersten Elementes.
  def peek
    if @queue.empty?
      puts "Fehler, die Queue ist leer!"
    else
      @queue.first
    end
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