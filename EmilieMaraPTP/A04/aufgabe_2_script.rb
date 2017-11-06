#Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zum Stack

# Date wird angefordert.
require_relative "aufgabe_2"

# Neues Objekt der Klasse Stack wird erstellt.
stack=Stack.new

# Methoden werden angewendet.
puts "Das erste Element wird hinzugefügt:" 
puts stack.push("Dame")
puts''

puts "Das zweite Element wird hinzugefügt:" 
puts stack.push("König")
puts''

puts "Das dritte Element wird hinzugefügt:" 
puts stack.push("Ass")
puts''

puts "Das letzte Element wird entfernt:" 
puts stack.pop
puts''

puts "Das neue letzte Element wird ausgegeben:" 
puts stack.peek
puts''

puts "Die Länge des Arrays lautet:"
puts stack.size
