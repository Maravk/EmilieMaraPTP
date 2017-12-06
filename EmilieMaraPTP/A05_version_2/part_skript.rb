# Author: Emilie Schuller, Mara von Kroge, 24. November 2017
# TeamChallenger
# Skript zur Klasse Part

require_relative 'part.rb'
require_relative 'part_to_file'

auto = Part.new("Auto", 1380)

puts "Es wird eine Stückliste Auto erstellt."
auto_reifen = Part.new("Reifen", 120, auto)
puts "Das übergeordnete Teil lautet: "
puts auto_reifen.parent.name
puts
puts "Das Teil Reifen wird hinzugefügt."
auto.add_part(auto_reifen)
printf "Nun besteht das Auto aus so vielen Teilen: "
puts auto.parts_amount
puts "Diese Teile und deren Gewicht in Kilogramm sind:"
puts auto.parts_and_mass.to_s
puts
puts "Nun fügen wir noch ein Teil \"Bremsen\" hinzu."
auto_bremse = Part.new("Bremsen", 40, auto)
auto.add_part(auto_bremse)
printf "Nun besteht das Auto aus so vielen Teilen: "
puts auto.parts_amount
puts "Diese Teile und deren Gewicht in Kilogramm sind:"
puts auto.parts_and_mass
puts
puts "Das Teil Motor wird hinzugefügt."
auto_motor = Part.new("Motor", 480)
auto.add_part(auto_motor)
printf "Nun besteht das Auto aus so vielen Teilen: "
puts auto.parts_amount
puts "Diese Teile und deren Gewicht in Kilogramm sind:"
puts auto.parts_and_mass
puts
puts "Das Teil Zylinder wird hinzugefügt."
auto_zylinder = Part.new("Zylinder", 18, auto_motor)
auto_motor.add_part(auto_zylinder)
printf "Nun besteht das Auto aus so vielen Teilen: "
puts auto.total_parts_amount
puts

puts "Zylinder ist ein Teil von: " + auto_zylinder.parent.name.to_s
puts "Zylinder ist Teil vom Ganzen: " + auto_zylinder.top.name.to_s

puts "Der Motor besteht aus diesen Teilen: "
puts auto_motor.parts_and_mass
puts "\n"
puts "Hier die Stückliste \"Auto\" als Tabelle:"
puts
puts auto.parts_table

puts
puts "Zylinder ist Einzelteil vom Ganzen: " + auto_zylinder.top.name
puts "Masse des ganzen Autos in Kilogramm: " + auto.mass_of_all.to_s
puts "Das Auto besteht aus insgesamt #{auto.total_parts_amount.to_s} Einzelteilen."
puts "Bremse wird entfernt."
auto.remove(auto_bremse)
puts "Auto besteht nun aus insgesamt #{auto.total_parts_amount.to_s} Einzelteilen."
puts''
puts "Hier ist die Stückliste \"Auto\" als Tabelle:"
puts ''
puts auto.parts_table

puts "Masse des ganzen Autos in Kilogramm: " + auto.mass_of_all.to_s

puts "Darstellung der Each-Ausgabe:"
puts auto.to_s
puts''
# Beim Debuggen ist hier kein Fehler, aber beim Script kommt noch zusätzlich einmal der Gümmelmotor
puts auto.print_complete



puts "\n\n\n##################################################"
puts "Speichern der Informationen über die neue Stückliste Computer."
computer = Part.new("Computer",12)

hardware = Part.new("Hardware", 7, computer)
cpu = Part.new("CPU", 1, hardware)
grafikkarte = Part.new("Grafikkarte", 2, hardware)
kühler = Part.new("Kühler", 4, hardware)
hardware.add_part(cpu)
hardware.add_part(grafikkarte)
hardware.add_part(kühler)
computer.add_part(hardware)

extern = Part.new("Extern", 4, computer)
tastatur = Part.new("Tastatur", 2, hardware)
maus = Part.new("Maus", 1, hardware)
extern.add_part(tastatur)
extern.add_part(maus)
computer.add_part(extern)


computer.save("computer_liste")
geladen = Part.new("PC", 20)
geladen.load("computer_liste")

puts "Erneute Ausgabe mittels Each:"
puts "Ausgabe aller enthaltenen Teile:"
puts geladen.print_complete
puts "Gewicht von der Stückliste Computer: #{geladen.mass_of_all}."

puts "Anzahl der Teile in der Stückliste: #{geladen.total_parts_amount.to_s}."