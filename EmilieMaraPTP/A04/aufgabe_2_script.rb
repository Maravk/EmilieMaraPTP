#Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zum Stack

# Date wird angefordert.
require_relative "aufgabe_2"

# Neues Objekt der Klasse Stack wird erstellt.
stack=Stack.new


# Methoden werden angewendet.
puts "Erstes Element wird hinzugefügt: " 
p stack.hinzufuegen_am_ende("Dame")
puts''

puts "Zweites Element wird hinzugefügt: " 
p stack.hinzufuegen_am_ende("König")
puts''

puts "Drittes Element wird hinzugefügt: " 
p stack.hinzufuegen_am_ende("Ass")
puts''

puts "Das letzte Element wird entfernt: " 
p stack.entfernen_am_ende
puts''

puts "Das neue letzte Element wird ausgegeben: " 
p stack.letztes_element_ausgeben