# Author:: Ralf Herrmann
# Author:: Emilie Schuller
# 18. Dezember 2017
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  
  def initialize()
    # Die zur Verfügung stehenden Farben
    @elements = ["pink", "blue", "yellow", "green", "grey", "red"]
      
      # 10 Runden insgesamt
    @rounds_left = 10
      
    # Die festgelegte Länge einer Ratekombination.
    @length = 4
  end 
  
  # Vierstellige Kombination des Computers wird zufällig generiert.
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
        @kombination_computer.push(@elements[4])
      end
      
      if kombination_computer1 == 6
        @kombination_computer.push(@elements[5])
      end
    end
  end

  
  # Mensch gibt seinen Rateversuch ein
  def kombination_mensch
    
      # Eingabe des Menschen
      @eingabe_mensch_konsole = gets.chomp.split(" ")
      return @eingabe_mensch_konsole
      
      # Tipp für den User
      if @eingabe_mensch_konsole == ["t"]
        puts "Die Farbe #{@kombination_computer.sample} ist enthalten."
      end 
      
      if @eingabe_mensch_konsole != "t"
      # Überprüfung der Eingabe
      @eingabe_mensch_konsole.each {|farbe|
          raise TypeError, "Bitte geben Sie Farben ein." if !@elements.include?(farbe)
      }
      end
      
      return @eingabe_mensch_konsole
  end 
  
  
   def durchgang
    # Für jeden neuen Durchgang werden die Zähler für die Direkten und Indirekten Treffer auf null gesetzt.
      @black_hits = 0
      @white_hits = 0

    # Stets werden zwei Codes miteinander verglichen. 
    hits = vergleiche_codes(@kombination_computer, @eingabe_mensch_konsole)
    @black_hits = hits[0]
    @white_hits = hits[1]
  
  
  # Spiel gewonnen, sobal vier Direkte Treffer erzielt wurden.
  if @black_hits == 4
    puts 'Der Computer hat gewonnen.'
    exit
  else
    
    # Ausgabe auf die Konsole bezüglich der Anzahl der Direkten und Indirekten Treffer.
    puts "Runden übrig: #{@rounds_left}"
    puts "    Direkte Treffer:   #{@black_hits}"
    puts "    Indirekte Treffer: #{@white_hits}\n\n"
  end
  @rounds_left -= 1

  # Bis alle Runden vorbei sind.
  until @rounds_left == 0
p  kombination_mensch
  durchgang
  end
end


# Vergleicht zwei Codes und gibt die Anzahl der Direkten und Indirekten Treffer zurück.
  def vergleiche_codes(code_one, code_two)
  
  # Klone werden erstellt, damit der originale Inhalt nicht verändert wird.
    code1 = code_one.clone
    code2 = code_two.clone
    black_hits = 0
    white_hits = 0

  # Direkte Treffer
  # Stellen der Treffer werden mit ungültigen Werten überschrieben, um wiederholte Zählung bei Indiekten Treffern zu vermeiden.
    code1.each_index { |index|
      if code1[index] == code2[index]
        code1[index] = 0
        code2[index] = -1
        black_hits += 1
        end
        }

  # Indirekte Treffer
  # Stellen der Treffer werden mit ungültigen Werten überschrieben, um wiederholte Zählung zu vermeiden.
    code1.each_index { |index1|
      code2.each_index { |index2|
        if code1[index1] == code2[index2]
          code1[index1] = 0
          code2[index2] = -1
          white_hits += 1
          end
        }
      }
  
      # Rückgabe eines Arrays
      # Direkte Treffer stehen beim 0. Index
      # Indirekte Treffer stehen beim 1. Index
      return [black_hits, white_hits]
      
      
      end
  end   