# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste

#require "aufgabe_1"
#include Enumerable 


computer = {"Prozessor" => 0.01, "Grafikkarte" => 1.3, "Gehäuse" => 7, "Kühler" => 0.7, "Netzteil" => 1.5, "Mainboard" => 1, "SSD" => 0.1}
puts ""
puts "Ausgabe der kompletten Stückliste Autoteile:"
puts ''
computer.each {|a, b| puts "Stück: #{a};  Masse in Kilogramm: #{b}"}
puts''
puts "Das Gesamtgewicht der Stückliste beträgt #{computer.values.map.reduce(:+) } Kilogramm!"
puts''
puts "Die Stückliste besitzt insgesamt #{computer.length} Elemente!"