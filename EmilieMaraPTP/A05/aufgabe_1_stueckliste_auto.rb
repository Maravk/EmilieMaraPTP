# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste - Skript

#require "aufgabe_1"
#include Enumerable 

autoteile = {"Karosserie" => 254, "Motor" => 200, "Auspuff" => 16, 
  "Reifen" => 40, "Kühler" => 1, "Lenkrad" => 2, "Scheinwerfer" => 8, 
  "Radio" => 1}

  puts ""
puts "Ausgabe der kompletten Stückliste Autoteile:"
puts ''
autoteile.each {|a, b| puts "Stück: #{a};  Masse in Kilogramm: #{b}"}
puts''
puts "Das Gesamtgewicht der Stückliste beträgt #{autoteile.values.map.reduce(:+) } Kilogramm!"
puts''
puts "Die Stückliste besitzt insgesamt #{autoteile.length} Elemente!"