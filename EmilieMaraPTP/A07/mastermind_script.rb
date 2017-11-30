# Author:: Ralf Herrmann, Mara von Kroge, Emilie Schuller
# TeamNilClass && TeamChallenger
# 29. November 2017
# Benutzereingaben über die Konsole für das Spiel MasterMind

require_relative "mastermind"

puts " #####################################################################################################################"
  puts "\n# Guten Tag bei MasterMind!\n# Mittels diesen Programms können sie Ihr logischen Denken sowie Ihre Fähigkeiten im Sektor der Stochastik austesten!\n\n"

  emi=MasterMind.new
  emi.kombination_computer

  puts "# Der Computer hat sich nun seinen vierstelligen Code ausgedacht."
  puts "# Nun dürfen Sie versuchen, die Kombination zu erraten!"
  puts "# Geben Sie hierfür vier Farben hintereinander sein, stets durch ein Leerzeichen getrennt!"
  puts "# Sofern eine Ihrer geratenen Farben richtig ist, sich aber an der falschen Stelle befindet,\n# erscheint die Ausgabe Indirekter Treffer und sofern die Farbe an der richtigen Stelle steht,\n# erscheint Direketer Treffer!\n"
  
  emi.ermitte_kombination_computer