# Author:: Emilie Schuller
# 17. Dezember 2017
# Mastermind - Computer ist Codebreaker

require_relative "mastermind_ai.rb"

class MasterMindAI
  def initialize()
    @elements = ["yellow", "blue", "red", "green", "pink", "grey"]
    @length = [0,1,2,3]
  end
  
  # Set aus allen möglichen Farbkombinationen (1296 Varianten).
  def computer_code
  computer = @elements.repeated_permutation(4).to_a
  end
  
  
  # Mensch wählt seinen Code.
  def mensch_code
    puts "Sie können nun Ihren vierstelligen Code auswählen."
    mensch_code = gets.chomp.split(" ")
  end 
  
  
  # Knuth's Algorithmus
  def knuth
    knuth_erstversuch = @elements[0] + @elements[0] + @elements[1] + @elements[1]
    if knuth_erstversuch == mensch_code
      puts self.spieler_gewinnt_message
      exit
    end 
  end
  
  
end
