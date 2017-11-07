# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Stack

# Klasse Stack wird erstellt.
class Stack
  def initialize
    
    # Neues Array wird erstellt.
    @stack=Array.new()
  end
  
  # Methode für das Hinzufuegen am Ende.
  def push(karte)
    @stack.push(karte)
  end
  
  # Methode für das Entfernen am Anfang.
  def pop
    if @stack.empty?
      puts "Fehler, der Stack ist leer"
    else
      @stack.pop  
    end 
  end
  
  # Methode für das Ausgeben des obersten Elementes.
  def peek
    if @stack.empty?
      puts "Fehler, der Stack ist leer"
    else
      @stack.last
    end
  end
  
  # Methode für die Laenge des Arrays.
  def length
    @stack.length
  end
  
  # Methode für das ausgeben des Arrays.
  def to_s
    @stack.to_s
  end
end 