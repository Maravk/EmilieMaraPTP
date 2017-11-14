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
puts @teil
puts''

# Prozessor, Grafikkarte und Mainboard als Teile von Hardware hinzufügen.
@teile << "Prozessor"
@teile << "Grafikkarte"
@teile << "Mainboard"
puts @teile
puts ''

# Computer als Ganzes hinzufügen.
@ganzes << "Computer"
puts @ganzes