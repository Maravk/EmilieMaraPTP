# Author:: Emilie Schuller, Mara von Kroge, Ralf Herrmann
# TeamNilClas
# 29. November 2017
# Künstliche Intelligenz - MasterMind - Mensch ist Codemaker
  
  puts "Bitte geben sie Ihre Vierer-Kombination an Farben an:"
 kombination_mensch = gets.chomp.to_s
 kombination_mensch = kombination_mensch.to_a
puts kombination_mensch.each{|farbe| farbe}
  
if kombination_mensch.include?(farbe != @elements.each)
   puts "Bitte gib eine Farbenkombination aus den zur Verfügung stehenden Farben aus!"
 end 
 