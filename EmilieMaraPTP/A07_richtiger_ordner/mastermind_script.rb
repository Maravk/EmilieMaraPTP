# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 29. November 2017
# Benutzereingaben über die Konsole für das Spiel MasterMind

require_relative "mastermind"

puts " #####################################################################################################################"
puts "\n# Guten Tag bei MasterMind!\n# Mittels diesen Programms können sie Ihr logischen Denken sowie Ihre Fähigkeiten im Sektor der Stochastik austesten!\n\n"

mara=MasterMind.new
mara.kombination_computer

puts "# Der Computer hat sich nun seinen vierstelligen Code ausgedacht. Nun dürfen Sie versuchen, die Kombination zu erraten!"
puts "# Geben Sie hierfür vier Zahlen hintereinander ein, stets durch ein Leerzeichen getrennt!"
puts "# Die zur Verfügung stehenden Zahlen lauten: pink, green, grey, red, blue, yellow!"
puts "# Sofern eine Ihrer geratenen Zahlen richtig ist, sich aber an der falschen Stelle befindet,\n# erscheint die Ausgabe Indirekter Treffer und sofern die Zahl an der richtigen Stelle steht, erscheint Direketer Treffer!\n"
puts "# Ihre Eingabe: \n\n"
mara.ermitte_kombination_computer