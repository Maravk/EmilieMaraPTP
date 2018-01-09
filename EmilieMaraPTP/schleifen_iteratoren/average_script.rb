# Author:: Emilie Schuller
# 06. Dezember 2017
# Average-Skirpt

require_relative "average"

puts "Bitte gib einen Input an n-vielen Zahlen ohne Kommata mit Blankspace ein und das Programm wird Ihnen den Durchschnitt ermitteln!"
emi=Average.new
emi.average_with_nil
puts "Der Mittelwert Ihrer Eingabe beträgt folgenden Wert:"
emi.output