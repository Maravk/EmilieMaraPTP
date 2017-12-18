# Author:: Emilie Schuller
# Author:: Mara von Kroge
# 07. Dezember 2017
# Mastermind AI

class MasterMindAI
  def initialize (length = 4, elements = 6)
    
    # Es gibt stets 6 Farben und die Farbenkombination beinhaltet je 4 Elemente.
    @elements = [1,2,3,4,5,6]
    @length = [1,2,3,4]
  end
  

  # Kombination wird vom Menschen ausgewählt.
  def kombination_mensch
  kombination_mensch_konsole = gets.chomp.to_s 
    @kombination_mensch = []
  @kombination_mensch = kombination_mensch_konsole.split(" ")
  end 

  # Array aus allen möglichen Farbkombinationen (1296)
  def permutation
   permutation = @elements.repeated_permutation(4).to_a
   @codes = permutation
  end 

  # Rateversuche des Computers
  def kombination_computer
    @kombination_computer = Array.new
    @kombination_computer.push(@codes.sample)
    
    # Kein Integer 
    p @kombination_computer.to_i
      puts
    end 
  end
  
  # Knuth-Algorithmus
  public
  def knuth
    
    # Knuth's Erstwahl
    knuth = Array.new
    knuth << @elements[0] << @elements[1] << @elements[2] << @elements[3]
    p knuth
    if knuth == @kombination_mensch
      puts "Der Computer hat Ihren Code geknackt."
      self.bewertung
      exit
    end
    
    if knuth != @kombination_mensch
      @codes.delete(knuth)
      p @codes
    end  
  end 
  
  # Bewertung der Trefferversuche mit Direkten und Indirekten Treffern
  def bewertung
    
    # Indirekter Treffer
    @weiss = 0
    
    # Direkter Treffer
    @black = 1
    
    # Jeweils vier Farben
    n = 0
    while (n<4) do
      
      # Direkter Treffer
      if @kombination_mensch[n] == @kombination_computer[n]
        @black += 1
      
      # Indirekter Treffer
      elsif 1.times do @kombination_computer.include?(@kombination_mensch[n])
        @weiss += 1
                    end 
      end 
      
      # n-Zähler
      n+=1

      if  @kombination_mensch == @kombination_computer
        puts "Der Computer hat Ihren Code erraten."
        exit
      end 
      
    # While-Ende  
   end
 
  
  
  # Rundenausgabe
  def runden
    i = 0
    while i < 10
    # Ausgabe auf die Konsole
    puts "Runde #{i+1}"
      puts "    Der Computer hat #{@white.to_s}-mal einen indirekten Treffer!\n"
      puts "    Der Computer hat #{@black.to_s}-mal einen direkten Treffer!\n\n"
     i+=1

             self.kombination_computer
             self.bewertung
             self.runden  
             end 
  end 
     
   
  # Klassen-End
end