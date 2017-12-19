# Author:: Dominik Tobaben, Emilie Schuller, Ralf Herrmann
# 17. Dezember 2017
# Christmas Tree Pattern - Script

require_relative "christmas_tree_pattern"

# Frage nach der n.-ten Ordnung
# Maximal 15.-te Ordnung, da es sonst zu lange dauern würde.

puts "Guten Tag! Die wievielte Ordnung des Christmas Tree Pattern möchten Sie ausgeben lassen?"
puts "Geben Sie hierfür einen Integer im Wertebereich von 1 bis 20 inklusive ein."

eingabe = gets.chomp.to_i

range = (1..15)
  raise TypeError, "Bitte geben Sie eine n.-te Ordnung im Bereich von 1 bis 15 ein." if !range.include?(eingabe)
  
a = Tree.new(eingabe)
a.print 