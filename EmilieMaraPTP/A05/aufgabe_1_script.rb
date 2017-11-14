# Author: Emilie Schuller, Mara von Kroge, 14. November 2017
# TeamChallenger
# Skript zur Klasse "Teil"

require_relative "aufgabe_1"
include Enumerable
include Comparable 
  

@teil = []
@ganzes = []
@teile = []

#@prozessor = [].to_a
#@grafikkarte = [].to_a
#@mainboard = [].to_a

# Hardware und Software als Teile hinzufügen.
@teil << "Hardware"
@teil << "Software"
puts "Die Klasse Teil besitzt zwei Teile:"
puts @teil
puts''

# Prozessor, Grafikkarte und Mainboard als Teile von Hardware hinzufügen.
@teile << "Prozessor"
@teile << "Grafikkarte"
@teile << "Mainboard"
puts "Folgende Einzelteile wurden zum Teil hinzugefügt:"
puts @teile
puts ''

# Computer als Ganzes hinzufügen.
if !@ganzes.include?("Computer")
puts "Der Computer wird als Ganzes hinzugefügt:"
puts @ganzes << "Computer"
puts ''
end 

# Tastatur als Ganzes hinzufügen.
if !@ganzes.include?("Tastatur")
puts "Die Tastatur wird als Ganzes hinzugefügt:"
puts @ganzes
end
puts ''

# Tastatur vom Ganzen entfernen.
@ganzes.delete("Tastatur")
puts "Die Tastatur wurde vom Ganzen entfernt, das Ganze besteht nur noch aus einem Element:"
puts @ganzes
puts ''

# Teil-Array als String ausgeben.
puts "Die beiden Teile werden ausgegeben:"
puts @teil.map(&:to_s)
puts ''

# Erstes Teil von Teil ausgeben.
puts "Das erste Element von Teil wird ausgegeben:"
puts @teil.first