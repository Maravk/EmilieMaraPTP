# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 01.12.2017
# MasterMind - Mensch ist Codemaker - Skript

require_relative "mastermind_ai"

puts " #####################################################################################################################"
  puts "\n# Guten Tag bei MasterMind!\n# Mittels diesen Programms können sie Ihr logischen Denken sowie Ihre Fähigkeiten im Sektor der Stochastik austesten!\n\n"
  puts "# Bitte geben Sie nun aus den Farben yellow, blue, red, green, pink sowie grey vier Stück aussuchen und diese in die Konsole eingeben!\n# Der Computer wird dann versuchen, Ihren Code zu knacken!"
  
  emi=MasterMindAi.new
  emi.kombination_mensch
  