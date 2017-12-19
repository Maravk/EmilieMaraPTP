# Author:: Ralf Herrmann
# Author:: Emilie Schuller
# 18. Dezember 2017
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  
  def initialize()
    # Die zur Verfügung stehenden Farben
    @elements = ["pink", "green", "grey", "red", "blue", "yellow"]
      
    # Die festgelegte Länge einer Ratekombination.
    @length = 4
  end 
  
  # vierstellige Kombination des Computers wird zufällig generiert.
  def kombination_computer
    @kombination_computer = Array.new
    while @kombination_computer.size < 4 do
      kombination_computer1 = rand(1..6) 

      if kombination_computer1 == 1
        @kombination_computer.push(@elements[0])
      end
      
      if kombination_computer1 == 2
        @kombination_computer.push(@elements[1])
      end
      
      if kombination_computer1 == 3
        @kombination_computer.push(@elements[2])
      end
      
      if kombination_computer1 == 4
        @kombination_computer.push(@elements[3])
      end
      
      if kombination_computer1 == 5
     p   @kombination_computer.push(@elements[4])
      end
      
      if kombination_computer1 == 6
        @kombination_computer.push(@elements[5])
      end
    end
  end


  # Kombination des Computers wird versucht zu erraten.
  def ermitte_kombination_computer
    
    # 10 Runden
    i = 0
    while i < 10 do
      
      # Eingabe des Menschen
      @eingabe_mensch_konsole = gets.chomp.split(" ")
 
        
      # Überprüfung der Eingabe - Länge
      if @eingabe_mensch_konsole.length != 4
        raise TypeError do "Bitte geben Sie 4 Farben ein."
        end
      end
      
      # Überprüfung der Eingabe - Farben
#        if !@eingabe_mensch_konsole.include?("pink" || "yellow" || "green" || "blue" || "grey" || "red")
#          raise TypeError do "Bitte geben Sie Farben ein."
#          end
#      end
      
      
      # Instanzvariablen für Direkte und Indirekte Treffer
      # Farbe ist richtig (Indirekter Treffer)
      @white = 0  
      
      # Farbe und Position ist richtig (Direkter Treffer)
      @black = 0  
      
      
      # Zähler für Direkte und Indirekte Treffer
      n = 0 
      while (n < 4)
        if @eingabe_mensch_konsole[n] == @kombination_computer[n]
          @black += 1
          
        elsif @kombination_computer.include?(@eingabe_mensch_konsole[n])
          @white += 1
        end
        n += 1
      end
      
      
      # Ausgabe auf die Konsole
      puts "Runde #{i+1}:"
      puts "    Sie haben #{@white.to_s}-mal einen indirekten Treffer!\n"
      puts "    Sie haben #{@black.to_s}-mal einen direkten Treffer!\n\n" 

      # Tipp für den User
      tipp = gets.chomp.to_s
      if tipp == "t"
      puts "Die Farbe #{@kombination_computer.sample} ist enthalten."
      end 
  
      
      # Richtige Lösung
      if @eingabe_mensch_konsole == @kombination_computer
        puts "Yeha! Sie haben die Kombination des Computers in #{i+1} Versuchen erraten!"
        exit 
      end
      
      # 10 Runden sind vorbei.
      i += 1
      if i == 10
        puts "Vielleicht klappt es nächste Runde!"
      end
    end
  end   
end