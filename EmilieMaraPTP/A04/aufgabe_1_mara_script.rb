# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zur Queue

# Date wird angefordert.
require_relative "./A04/aufgabe_1"

# Neues Objekt der Klasse Queue wird erstellt.
queue=Queue.new


puts "Das erste Element wird entfernt:" 
puts queue.dequeue
puts ''

puts "Das neue erste Element wird ausgegeben:" 
puts queue.peek
puts ''

puts "Die Länge des Arrays lautet:"
puts queue.size
puts ''

puts "Das fertige Array sieht folgendermaßen aus:"
puts queue.to_s
puts ''
