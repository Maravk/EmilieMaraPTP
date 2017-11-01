# Author:: Mara von Kroge, Emilie Schuller, 29. Oktober 2071
# Script zu Stack

# Datei wird angefordert
require_relative "aufgabe_2"

# Einfügen eines neuen Elements am Ende
puts stack.push << "What-a-lotta Chocolate"

# Gibt das Element am Anfang zurück, belässt es aber im Stack
puts stack.shift

# Entfernen des Elements am Ende
puts stack.pop