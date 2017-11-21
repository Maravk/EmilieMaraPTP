# Author: Emilie Schuller, Mara von Kroge
# TeamChallenger
# 21.11.2017
# Part Skript

require_relative 'part'

# Neues Objekt wird erstellt und mit Werten initialisiert.
auto = Part.new("Auto", 0, nil)

# Einzelteile werden hinzugefügt.
auto.add_part("Reifen", 45)
auto.add_part("Motor", 850)

# Wie viele Einzelteile enthalten sind.
puts auto.size_parts()

# Das Gesamtgewicht.
puts auto.total_weight()

# Einzelteil wird hinzugefügt.
auto.add_part("Sitze", 20)
puts ''

# Datei wird erstellt.
auto.write_to_file()
auto.load_from_file("A05/Auto")
puts auto.name()
puts ''

# Oberstes Teil - hier nil
puts auto.parent()

# Gesamtgewicht
puts auto.total_weight()

# Wie viele Einzelteile enthalten sind.
puts auto.size_parts()

# Ausgabe von Auto
puts auto.to_s()


# Neues Objekt Hardware - dieses Mal mit Parent
hardware = Part.new("Hardware", 1000, "Computer")

# Einzelteile werden hinzugefügt.
hardware.add_part("CPU",0.01)
hardware.add_part("Mainboard", 1)
hardware.add_part("Grafikkarte", 2)

# Datei wird erstellt.
hardware.write_to_file()
hardware.load_from_file("A05/Hardware")
puts hardware.name()

# Wie viele Elemente insgesamt enthalten sind.
puts hardware.total_size()

# Gesamtgewicht
puts hardware.total_weight()

# Element wird entfernt
hardware.remove_part("Mainboard")

# Oberstes teil von Hardware
#puts hardware.top()

# Ausgabe von Hardware
hardware.to_s