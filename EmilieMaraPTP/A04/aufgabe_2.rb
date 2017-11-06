# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Stack

# Klasse Stack wird erstellt und initialisiert.
class Stack
  def initialize
    
    # Neues Array wird erstellt.
    @stack=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def push(karte)
    @stack << karte
  end
  
  # Methode für das Entfernen am Anfang.
  def pop
    @stack.pop
  end
  
  # Methode für das Ausgeben des obersten Elementes.
  def peek
    @stack.last
  end

end 