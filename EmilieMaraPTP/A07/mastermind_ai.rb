# Author:: Rico Helmboldt
# 18. Dezember 2017
# Klasse zu Mastermind - Computer ist Codebreaker

class MasterMindAI
  
  attr_reader :rounds_left
  
  def initialize()
    # Die zur Verfügung stehenden Farben.
    @elements = ["pink", "blue", "yellow", "green", "grey", "red"]
    
    # Set aus allen möglichen 4-er Farbkombinationen
    @codes = @elements.repeated_permutation(4).to_a
    
    # 10 Runden insgesamt
    @rounds_left = 10
    
    # Initialguess
    @last_guess = [1, 1, 2, 2]
  end

  # Kombination wird vom Menschen ausgewählt.
  def kombination_mensch
    @kombination_mensch_konsole = gets.chomp.split(" ")

    
    # TypeError, falls die Eingabe ungültig ist.
    @kombination_mensch_konsole.each { |farbe|
      raise TypeError, 'Bitte geben Sie eine gültige Farbe ein' if !@elements.include?(farbe) 
    }
    
   return @kombination_mensch_konsole

  end
  
  def durchgang
    # Für jeden neuen Durchgang werden die Zähler für die Direkten und Indirekten Treffer auf null gesetzt.
    @black_hits = 0
    @white_hits = 0
    
    
    # Initialguess vom Knuth Algorithmus' (1122)
    knuth_guess = knuth
    
    # Stets werden zwei Codes miteinander verglichen. 
    hits = compare_codes(knuth_guess, @kombination_mensch_konsole)
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

    # Bis alle Runden vorbei sind oder der Computer vier Direkte Treffer hat.
  until @rounds_left == 0 || @black_hits == 4
  durchgang
  end
  end
  

  # Knuth Algorithmus
  def knuth
    
    # 10 Runden
    if @rounds_left == 10
      
      # Initialguess von Knuth nur beim ersten Versuch 
      @last_guess = ["pink", "pink", "blue", "blue"]
      return @last_guess
    end 
    
    # Bewertung des Versuchs
    @codes.each_index { |index|
      
      # Werte aus compare_codes werden übertragen
      # Es wird überprüft, ob jeder Code aus der Permutation das selbe Ergebnis an Direkten und Indirekten Treffern erzielt.
      # Wenn nicht, wird der jeweilige Codeindex rausgelöscht.
      hits = compare_codes(@last_guess, @codes[index])
      black_hits = hits[0]
      white_hits = hits[1]
      if black_hits != @black_hits && white_hits != @white_hits
        @codes.delete(index)
        end 
    }
    
    # Nächster Rateversuch des Computers wird aus der Permutation generiert.
      @codes.compact!
      next_guess = @codes.sample
      @last_guess = next_guess
  end
  
  # Vergleicht zwei Codes und gibt die Anzahl der Direkten und Indirekten Treffer zurück.
  def compare_codes(code_one, code_two)
    
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