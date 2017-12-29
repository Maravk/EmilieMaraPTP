# Author:: Rico Helmboldt
# Script zur Klasse Temp

require_relative "mastermind_ai.rb"

rico=MasterMindAI.new

puts "Kombination-Mensch eingeben, welche der Computer erraten soll:"
puts rico.kombination_mensch

puts "Nun beginnt der Computer, die Kombination zu erraten."
rico.knuth
puts rico.durchgang