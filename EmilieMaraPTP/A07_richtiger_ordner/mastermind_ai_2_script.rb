# Author:: Emilie Schuller
# Author:: Mara von Kroge
# 07. Dezember 2017
# Mastermind AI

require_relative "mastermind_ai_2"

emi=MasterMindAI.new

puts "Kombination-Mensch bitte eingeben."
p emi.kombination_mensch

puts "Nun erzeugt der Computer alle möglichen Farbkombinationen."
emi.permutation

puts "Nun wird geschaut, ob die Erstwahl Knuth's identisch mit der Kombination des Computers ist."
p emi.knuth

puts "Nun erfolgt die Bewertung des Versuchs."
p emi.bewertung
p emi.runden