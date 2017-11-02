# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Stack

# Klasse Stack wird erstellt und initialisiert.
class Stack
  def initialize
    
    # Neues Array wird erstellt.
    @stack=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def hinzufuegen_am_ende(karte)
    @stack << karte
  end
  
  # Methode für das Entfernen am Anfang.
  def entfernen_am_ende
    @stack.pop
  end
  
  # Methode für das Ausgeben des esten Elementes.
  def letztes_element_ausgeben
    @stack.last
  end
  
end 