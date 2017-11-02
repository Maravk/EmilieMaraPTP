#Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zur Queue

# Date wird angefordert.
require_relative "aufgabe_1"

# Neues Objekt der Klasse Queue wird erstellt.
@queue=Queue.new


# Methoden werden angewendet.
puts "Erstes Element wird hinzugefügt: " 
p queue.hinzufuegen_am_ende("Cookie Dough")
puts''

puts "Zweites Element wird hinzugefügt: " 
p queue.hinzufuegen_am_ende("Karamel Sutra")
puts''

puts "Drittes Element wird hinzugefügt: " 
p queue.hinzufuegen_am_ende("What-a-lotta Chocolate")
puts''

puts "Das erste Element wird entfernt: " 
p queue.entfernen_am_anfang
puts''

puts "Das neue erste Element wird ausgegeben: " 
p queue.erstes_element_ausgeben