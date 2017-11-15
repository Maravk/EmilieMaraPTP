# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Stack

# Klasse Stack wird erstellt.
class Stack
  def initialize
    
    # Neues Array wird erstellt.
    @stack=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def push(karte)
    @stack.push(karte)
    return self
  end
  
  # Methode für das Entfernen am Anfang.
  def pop
    if @stack.empty?
      puts "Fehler, der Stack ist leer"
    else
      @stack.pop  
    end 
    return self
  end
  
  # Methode für das Ausgeben des obersten Elementes.
  def peek
    if @stack.empty?
      puts "Fehler, der Stack ist leer"
    else
      @stack.last
    end
  end
  
  # Methode für die Länge des Arrays.
  def length
    @stack.length
  end
  
  # Methode für das Ausgeben des Arrays.
  def to_s
    @stack.to_s
  end
  
  # Methode für Empty
  def empty?
   if @stack.empty?
      puts "Dieses Array ist leer, das erste Element wurde entfernt!"
      return true
    else
      puts "Dieses Array ist nicht leer!"
      return false
    end
  end
end  