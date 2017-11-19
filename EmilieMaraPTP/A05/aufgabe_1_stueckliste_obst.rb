# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste

#require "aufgabe_1"
#include Enumerable 

obst = {"Äpfel" => 0.5, "Bananen" => 0.3, "Kiwis" => 0.2, "Ananas" => 0.6, "Wassermelone" => 1} 
puts ""
puts "Ausgabe der kompletten Stückliste Obst:"
puts ''
puts "______________________________________________________"
obst.each {|a, b|
  printf("|Stück: %s  |  Masse in Kilogramm: %s|\n", sprintf("%15s", a), sprintf("%5s", b))
}
puts''
puts "Das Gesamtgewicht der Stückliste beträgt #{obst.values.map.reduce(:+) } Kilogramm."
puts''
puts "Die Stückliste besitzt insgesamt #{obst.length} Elemente."