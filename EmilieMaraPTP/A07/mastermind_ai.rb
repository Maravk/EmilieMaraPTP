# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 01.12.2017
# MasterMind - Mensch ist Codemaker - Klasse

class MasterMindAi
  include Enumerable
  include Comparable
  
  def initialize(elements = 6, length = 4)
    
    @elements = ["yellow", "blue", "red", "green", "pink", "grey"]
    @length = [0,1,2,3]
  end
  
  # Kombination wird vom Menschen ausgewählt.
  def kombination_mensch
  kombination_mensch_konsole = gets.chomp.to_s
  kombination_mensch = []
  kombination_mensch = kombination_mensch_konsole.split(" ")
  # Dies funktioniert gerade noch nicht
    if kombination_mensch.include?("yellow" || "blue" || "red" || "green" || "pink" || "grey")
      puts ""
    else
      puts "Bitte gib eine der gültigen Farben ein!"
    end 
end


  # Computer versucht, die Kombination zu erraten.
def ermittle_mensch_kombination
  alle_moeglichkeiten = [#1269 möglichkeiten]
end 
end 