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
  
  # Methode für das Entfernen am Anfang.
  def dequeue
    if @queue.empty?
      puts "Fehler, die Queue ist leer"
    else
    @queue.shift
    end
  end
  
  # Methode für das Ausgeben des ersten Elementes.
  def peek
    if @queue.empty?
      puts "Fehler, die Queue ist leer"
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
  
  # Methode für Empty
  def empty
    @queue.empty?
    if true
     puts "Dieses Array ist leer, das erste Element wurde entfernt!"
     return true
    else
      puts "Dieses Array ist nicht leer!"
      return false
    end
  end
end 