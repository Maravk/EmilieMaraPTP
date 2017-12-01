# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 01.12.2017
# MasterMind - Mensch ist Codemaker - Klasse

class MasterMindAi
  include Enumerable
  include Comparable
  
  def initialize(elemts = 6, length = 4)
    
    @elements = ["yellow", "blue", "red", "green", "pink", "grey"]
    @length = [0,1,2,3]
  end
  
  # Kombination wird vom Menschen ausgewählt.
  def kombination_mensch
  kombination_mensch_konsole = gets.chomp.to_s
  kombination_mensch = []
  kombination_mensch = kombination_mensch_konsole.split(" ")
    if kombination_mensch.include?("yellow" || "blue" || "red" || "green" || "pink" || "grey")
      puts ""
    else
      puts "Bitte gib eine der gültigen Farben ein!"
  end 
    p kombination_mensch
    
end
end 