# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 29.11.2017
# TeamChallenger
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  include Enumerable
  include Comparable
    
  def initialize(elements = 6, length = 4)

    @elements = ["yellow", "blue", "red", "green", "pink", "grey"]
    @length = [0,1,2,3]
  end
  
  # Kombination des Computers wird zufällig generiert.
  def kombination_computer
    @kombination_computer = []
 
    while @kombination_computer.length < 4 do
      kombination_computer1 = rand(1..6) 
      if kombination_computer1 == 1
        @kombination_computer << (@elements[0])
      end
      if kombination_computer1 == 2
        @kombination_computer << (@elements[1])
      end
      if kombination_computer1 == 3
        @kombination_computer << (@elements[2])
      end
      if kombination_computer1 == 4
        @kombination_computer << (@elements[3])
      end
      if kombination_computer1 == 5
        @kombination_computer << (@elements[4])
      end
      
      if kombination_computer1 == 6
        @kombination_computer << (@elements[5])
      end
    end
  end


  # Kombination des Computers wird versucht zu erraten
  def ermitte_kombination_computer
    i = 0
    while i < 10 do
      
      eingabe_mensch_konsole = gets.chomp.to_s
      eingabe_mensch = []
      eingabe_mensch = eingabe_mensch_konsole.split(" ")
      # Wie viele Farben wurden richtig erraten (Diese Methode können wir so nicht für das Spiel benutzen,
      # aber funktioniert schon mal gut
      #colors_guessed_right = 0
      #eingabe_mensch.each{|a| 
      #  if @kombination_computer.include?(a)
      #    colors_guessed_right += 1
      #  end
      #}
      #puts colors_guessed_right.to_s + " mal stimmt die Farbe"
        
      # Was hier noch fehlt: Die Rückgabe von Mastermind sind bis zu 4 Informationen, diese Informationen können
      # zwei Zustände haben: Farbe richtig oder Farbe und Position richtig (weiß und schwarz)
      # 4 mal schwarz heißt das Spiel ist gewonnen
      
      #Versuch einer Methode die alle Positionen durchgeht und sie auf Farbe und Position überprüft.
      
      @white = 0  # Farbe ist richtig
      @black = 0  # Farbe und Position ist richtig
      n = 0 
      while (n < 4)
        if eingabe_mensch[n] == @kombination_computer[n]
          @black += 1
        elsif @kombination_computer.include?(eingabe_mensch[n])
          @white += 1
        end
        n += 1
      end
      puts "Runde #{i}:"
      puts "    Sie haben #{@white.to_s}-mal einen indirekten Treffer!\n"
      puts "    Sie haben #{@black.to_s}-mal einen direkten Treffer!\n\n" 
  
      if eingabe_mensch == @kombination_computer
        puts "Yeha! Sie haben die Kombination des Computers in #{i} Versuchen erraten!"
      exit 
      end 
      
      i += 1
      if i == 10
        puts "Mist! In 10 Versuchen hast du den Code des Computers nicht knacken können! NOOOOOOB, hehehe!"
      end
    end
  end   
end 