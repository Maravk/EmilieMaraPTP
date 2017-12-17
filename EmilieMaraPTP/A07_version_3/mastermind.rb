# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 29.11.2017
# TeamChallenger
# Klasse zu MasterMind - Computer ist Codemaker

require_relative "mastermind_messages.rb"
require_relative "mastermind_start"
require_relative "mastermind_ai.rb"

class MasterMind
  include Enumerable
  include Comparable

    @elements = ["pink","green", "grey", "red", "blue", "yellow"]
    @length = 4

  
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
    
    # 10 Runden
    i = 0
    while i < 10 do
      
      # Eingabe des Menschen
      eingabe_mensch_konsole = gets.chomp.split(" ")
 
        
      # Überprüfung der Eingabe - Länge
      if eingabe_mensch_konsole.length != 4
        raise TypeError do "Bitte geben Sie 4 Farben ein."
        end
      end
      
      # Überprüfung der Eingabe - Farben
      eingabe_mensch_konsole.each do |a|
        if a != ("pink" || "yellow" || "green" || "blue" || "grey" || "red")
          raise TypeError do "Bitte geben Sie Farben ein."
          end
        end
      end
      
      
      # Methode, die alle Positionen durchgeht und sie auf Farbe und Position überprüft
      @white = 0  # Farbe ist richtig
      @black = 0  # Farbe und Position ist richtig
      
      
      # Direkte und Indirekte Treffern
      n = 0 
      while (n < 4)
        if eingabe_mensch[n] == @kombination_computer[n]
          @black += 1
          
        elsif @kombination_computer.include?(eingabe_mensch[n])
          @white += 1
        end
        n += 1
      end
      
      
      # Ausgabe auf die Konsole
      puts "Runde #{i+1}:"
      puts "    Sie haben #{@white.to_s}-mal einen indirekten Treffer!\n"
      puts "    Sie haben #{@black.to_s}-mal einen direkten Treffer!\n\n" 
  
      
      # Richtige Lösung
      if eingabe_mensch == @kombination_computer
        puts "Yeha! Sie haben die Kombination des Computers in #{i+1} Versuchen erraten!"
        exit 
      end
      
      # 10 Runden sind vorbei
      i += 1
      if i == 10
        puts "Vielleicht klappt es nächste Runde!"
      end
    end
  end   
end