# Author: Emilie Schuller, Mara von Kroge
# TeamChallenger
# 21.11.2017
# Part Skript

require_relative 'part'

auto = Part.new("Auto", 0, nil)

auto.add_part("Reifen", 45)
auto.add_part("Motor", 850)
auto.add_part("Scheinwerfer", 200)

# Wie viele Teile im Teil Auto enthalten sind.
puts auto.size_parts()

# Das bisher insgesamte Gewicht des Teils Auto.
puts auto.total_weight()

#auto.replace_new_part()

# Alle Einzelteile von Auto. 
puts auto.all_parts

# Oberteil von Auto: nil
puts auto.parent()

# Wie viele Elemente insgesamt in Auto enthalten sind.
puts auto.total_size

# Float
puts auto.total_weight()

# Ausgabe von Auto.
puts auto.to_s()


# Neues Objekt Hardware - dieses Mal mit Parent
hardware = Part.new("Hardware", 1000, "Computer")

hardware.add_part("CPU",0.01)
hardware.add_part("Mainboard", 1)
hardware.add_part("Grafikkarte", 2)
return self

puts hardware.total_size()
puts hardware.total_weight()
#hardware.replace_new_part("")
hardware.remove_part("Mainboard")
hardware.
puts hardware.top()
puts hardware.to_s()
