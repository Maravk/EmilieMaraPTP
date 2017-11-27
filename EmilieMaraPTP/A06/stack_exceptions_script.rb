# Author:: Mara von Kroge, Emilie Schuller
# 25. Noevember 2017
# TeamChallenger
# Script zum Stack inklusie Exceptions

# Datei wird angefordert.
require_relative "stack_exceptions"

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
puts stack.length
puts''

puts "Ist das folgende Array leer?"
puts stack.empty?
puts ''

puts "Das fertige Array sieht folgendermaßen aus:"
puts stack.to_s