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

@teil << "Hardware"
@teil << "Software"
puts @teil
puts''
@teile << "Prozessor"
@teile << "Grafikkarte"
@teile << "Mainboard"
puts @teile
puts ''
@ganzes << "Computer"
puts @ganzes