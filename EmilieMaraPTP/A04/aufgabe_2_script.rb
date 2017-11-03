#Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zum Stack

# Date wird angefordert.
require_relative "aufgabe_2"

# Neues Objekt der Klasse Stack wird erstellt.
stack=Stack.new


# Methoden werden angewendet.
puts "Das erste Element wird hinzugefügt:" 
puts stack.hinzufuegen_am_ende("Dame").to_s
puts''

puts "Das zweite Element wird hinzugefügt:" 
puts stack.hinzufuegen_am_ende("König").to_s
puts''

puts "Das dritte Element wird hinzugefügt:" 
puts stack.hinzufuegen_am_ende("Ass").to_s
puts''

puts "Das letzte Element wird entfernt:" 
puts stack.entfernen_am_ende.to_s
puts''

puts "Das neue letzte Element wird ausgegeben:" 
puts stack.letztes_element_ausgeben.to_s
puts''

puts "Das neue Array wird ausgegeben:"
puts stack.to_s
