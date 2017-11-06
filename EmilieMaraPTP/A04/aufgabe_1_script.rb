# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zur Queue

# Date wird angefordert.
require_relative "aufgabe_1"

# Neues Objekt der Klasse Queue wird erstellt.
queue=Queue.new

# Methoden werden angewendet.
puts "Das erste Element wird hinzugefügt:" 
puts queue.enqueue("Cookie Dough")
puts ''

puts "Das zweite Element wird hinzugefügt:"
puts queue.enqueue("Karamel Sutra")
puts ''

puts "Das dritte Element wird hinzugefügt:"
puts queue.enqueue("Half Baked")
puts''

puts "Das erste Element wird entfernt:" 
puts queue.dequeue
puts ''

puts "Das neue erste Element wird ausgegeben:" 
puts queue.peek
puts ''

puts "Die Länge des Arrays lautet:"
puts queue.size
