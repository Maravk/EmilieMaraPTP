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

  puts "# Der Computer hat sich nun seinen vierstelligen Code ausgedacht.mara Nun dürfen Sie versuchen, die Kombination zu erraten!"
  puts "# Geben Sie hierfür vier Farben hintereinander sein, stets durch ein Leerzeichen getrennt!"
  puts "# Die zur Verfügung stehenden Farben lauten: yellow, blue, red, green, pink und grey!"
  puts "# Sofern eine Ihrer geratenen Farben richtig ist, sich aber an der falschen Stelle befindet,\n# erscheint die Ausgabe Indirekter Treffer und sofern die Farbe an der richtigen Stelle steht, erscheint Direketer Treffer!\n"
  puts "# Ihre Eingabe (Beispiel: yellow green blue pink): \n\n"
  mara.ermitte_kombination_computer