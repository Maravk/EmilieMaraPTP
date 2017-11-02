# Author:: MAra von Kroge, Emilie Schuller, 28. Oktober 2017
# Queue

# Klasse Queue wird erstellt und initialisiert.
class Queue
  def initialize
    
    # Neues Array wird erstellt.
    queue=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def hinzufuegen_am_ende (eis)
    @queue << eis
  end
  
  # Methode für das Entfernen am Anfang.
  def entfernen_am_anfang
    @queue.shift
  end
  
  # Methode für das Ausgeben des esten Elementes.
  def erstes_element_ausgeben
    @queue.first
  end
  
end 