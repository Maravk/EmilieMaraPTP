# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Queue

# Klasse Queue wird erstellt.
class Queue
  def initialize
    
    # Neues Array wird erstellt.
    @queue=Array.new
  end
  
  # Methode für das Hinzufuegen am Ende.
  def enqueue (element)
    @queue.push(element)
  end
  
  # Methode für das Entfernen am Anfang.
  def dequeue
    @queue.shift
  end
  
  # Methode für das Ausgeben des ersten Elementes.
  def peek
    @queue.first
  end
  
  # Methode für die Laenge der Queue.
  def size
    @queue.size
  end
end