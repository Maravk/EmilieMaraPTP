# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zur Queue

# Date wird angefordert.
require_relative "aufgabe_1"

# Neues Objekt der Klasse Queue wird erstellt.
queue=Queue.new

# Methoden werden angewendet.
puts "Das erste Element wird hinzugefügt:" 
puts queue.hinzufuegen_am_ende("Cookie Dough").to_s
puts ''

puts "Das zweite Element wird hinzugefügt:" 
puts queue.hinzufuegen_am_ende("Karamel Sutra").to_s
puts''

puts "Das dritte Element wird hinzugefügt:" 
puts queue.hinzufuegen_am_ende("What-a-lotta Chocolate").to_s
puts''

puts "Das erste Element wird entfernt:" 
puts queue.entfernen_am_anfang.to_s
puts ''

puts "Das neue erste Element wird ausgegeben:" 
puts queue.erstes_element_ausgeben.to_s
puts ''

puts "Das neue Array wird ausgegeben:"
puts queue.to_s