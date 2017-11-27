# Author:: Mara von Kroge, Emilie Schuller
# 25. November 2017
# TeamChallenger
# SKript zur Klasse Queue inklusive Exceptions

# Datei wird angefordert.
require_relative "queue_exception"

# Neues Objekt der Klasse Queue wird erstellt.
queue=QueueException.new

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
puts ''

puts "Ist das folgende Array leer?"
puts queue.empty?
puts ''

puts "Das fertige Array sieht folgendermaßen aus:"
puts queue.to_s