# Author:: Mara von Kroge, Emilie Schuller
# 25. November 2017
# TeamChallenger
# Klasse Stack inklusive Exceptions

class Stack
  def initialize
    @stack=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def push(karte)
    if karte == nil
    raise TypeError, "You aren't allowed to add the Card nil, sorry!"
  end
  @stack.push(karte) 
  return self
end
    
  # Methode für das Entfernen am Anfang.
  def pop
    if @stack.length == 0
    raise IndexError, "This Stack is already empty!" 
    else
  @stack.pop
  return self
    end
end

  # Methode für das Ausgeben des obersten Elementes.
  def peek
    if @stack.length == 0
       raise IndexError, "This Stack is already empty!" 
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
    if @stack.length == 0
    raise IndexError, "This Stack already is empty!"
    else
    @stack.to_s
    end
  end
  
  # Empty?
  def empty?
    return @stack.empty?
  end
  
end 