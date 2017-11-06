# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Queue

# Klasse Queue wird erstellt und initialisiert.
class Queue
  def initialize
    
    # Neues Array wird erstellt.
    @queue=Array.new
    @queue=["Karamel Sutra", "Half Baked"]
  end
  
  # Methode für das Hinzufügen am Ende.
  def enqueue
    @queue << "Cookie Dough"
  end
  
  # Methode für das Entfernen am Anfang.
  def dequeue
    @queue.shift
  end
  
  # Methode für das Ausgeben des ersten Elementes.
  def peek
    @queue.first
  end
end