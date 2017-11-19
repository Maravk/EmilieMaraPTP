# Author: Emilie Schuller, Mara von Kroge, 14. November 2017
# TeamChallenger
# Skript zur Klasse "Teil"
#
require_relative "aufgabe_1"
include Enumerable
include Comparable 
  
@masse = [0.01, 1.3, 1, 50]
@teile = {"Prozessor" => @masse[0], "Grafikkarte" => @masse[1], "Mainboard" => @masse[2]}
@teil = {"Hardware" => @teile.to_s, "Programmierer" => {"Student" => @masse[3]}}
@ganzes = {"Computer" => @teil}

# Welche Teile die Klasse Teil besitzt.
puts "Die Klasse Teil besitzt folgende Teile:"
@teil.each_key {|key| puts key}
puts ''

# Teil zu Teil hinzufügen.
puts "Das Teil Software wurde zu Teile hinzugefügt."
@teil < {"Windows" => @masse << 0}
puts''

# Teile Kühler, Netzeil sowie SSD zu Hardware hinzugefügen.
puts "Die Teile Kühler, Netzeil sowie SSD werden zu Hardware hinzugefügt."
@teile["Kühler"] = 0.7
@teile["Netzteil"] = 1.5
@teile["SSD"] = 1.0
puts ''

# Teil "Software" entfernen.
puts "Das Teil Software wird entfernt."
@teil.delete("Windows")
puts ''

# Computer als Ganzes hinzufügen.
puts "Der Computer wird als Ganzes hinzugefügt:"
if !@ganzes.include?(11.61)
puts @ganzes[11.61] = "Computer"
puts '' 
end

# Tastatur als Ganzes hinzufügen.
if !@ganzes.include?("Kabel")
puts "Die Tastatur wird als Ganzes hinzugefügt:"
  puts @ganzes["Kabel"] ="Tastatur"
puts ''
end 

# Tastatur mit Maus austauschen.
if !@ganzes.include?("Maus")
  puts "Die Tastatur wurde mit der Maus als Ganzes ausgetauscht:"
  puts @ganzes.replace({"Maus" => "Kabel"})
end
puts ''

# Tastatur vom Ganzen entfernen.
@ganzes.delete("Tastatur")
puts "Die Tastatur wurde vom Ganzen entfernt, das Ganze besteht nur noch aus einem Element:"
puts @ganzes
puts ''

# Teil-Array als String ausgeben.
puts "Jedes vorhandene Teil wird ausgegeben:"
@teil.each_key {|key| puts key}
puts ''

# Erstes Teil von Teil ausgeben.
puts "Das erste Element von Teil lautet:"
puts @teil.first
puts ''

# Die Masse von Teil Hardware ausgeben
puts "Die Masse von Teil Hardware beträgt insgesamt #{@teile.values.map.reduce(:+)} Kilogramm!"
puts ''

# Das Oberste von Teil.
puts "Das erste Teil von Teile ist:"
puts @teile.first.to_s
