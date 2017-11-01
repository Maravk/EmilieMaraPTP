#Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Script zur Queue

# Date wird angefordert.
require_relative "aufgabe_1"

# Neues Element "Half Baked" wird am Ende hinzugefügt.
puts queue.push << "Half Baked"
puts queue
# Das erste Element "Cookie Dough" wird zurückgegeben, aber es bleib in der Queue.
puts queue.shift
puts queue
# Das letzte Element "Chocolate Fudge Brownie" wird entfernt.
puts queue.pop
puts''
puts queue