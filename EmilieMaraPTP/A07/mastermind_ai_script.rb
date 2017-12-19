# Author:: Rico Helmboldt
# Script zur Klasse Temp

require_relative "MasterMindAI.rb"

rico=MasterMindAI.new

puts "Kombination-Mensch eingeben:"
puts rico.kombination_mensch

puts "\n\nNun wird geschaut, ob die Erstwahl Knuth's identisch mit der Kombination des Computers ist."
puts rico.knuth
rico.compare_codes(rico.kombination_mensch.to_a, rico.knuth.to_a)
puts rico.durchgang