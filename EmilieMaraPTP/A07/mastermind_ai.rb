# Author:: Mara von Kroge, Emilie Schuller
# 18. Dezember 2017
# Klasse zu Mastermind - Computer ist Codebreaker

class MasterMindAI
  
  attr_reader :rounds_left
  
  def initialize()
    # Die zur Verfügung stehenden Farben.
    @elements = ["pink", "blue", "yellow", "green", "grey", "red"]
    
    # Array aus allen möglichen 4-er Farbkombinationen
    @codes = @elements.repeated_permutation(4).to_a
    
    # Kopie von allen möglichen Varianten
    @set = @codes.dup
    
    # 10 Runden insgesamt
    @rounds_left = 10
    
    # Initialguess
    @last_guess = ["pink", "pink", "blue", "blue"]
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
    
    
    # Initialguess vom Knuth Algorithmus' (1122/pink pink blue blue)
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

    # Bis alle Runden vorbei sind.
    until @rounds_left == 0
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
      # Wenn nicht, wird der jeweilige Codeindex rausgelöscht, indem er mit nil überschrieben wird.
      hits = compare_codes(@last_guess, @codes[index])
      black_hits = hits[0]
      white_hits = hits[1]
      if black_hits != @black_hits && white_hits != @white_hits
        @codes[index] = nil
      end
        
      return next_guess
    }
  end
    
    
  # Stets der nächste Rateversuch
  def next_guess
    
    # Nächster Rateversuch des Computers wird aus der Permutation generiert.
    # Alle Nil's werden aus dem Array mit allen Varianten rausgelöscht.
    @codes.compact!
    @kombination_mensch_konsole = kombination_mensch
    remaining_possibilities = @codes.dup
    remaining_possibilities2 = @codes.dup
    ergebnis = []
      puts ergebnis
   
    # So viele Hashes in das Ergebnis-Array, wie lang das Array ist
    ergebnis_length = ergebnis.length()
    ergebnis_length.times do 
      ergebnis.push(Hash.new)
    end
      
    # Jede Kombination wird mit jeder Kombination verglichen.
    remaining_possibilities.each_index {|index| 
      remaining_possibilities2.each_index {|index2| 
        compare_codes(remaining_possibilities[index], remaining_possibilities2[index2])
      
        # Der Hash wird stets hochgezählt.
        vergleich = compare_codes(remaining_possibilities[index], remaining_possibilities2[index2])
        if ergebnis[index].has_key?(vergleich)
          ergebnis[index] += 1
        else 
          ergebnis[index] = 1
        end     
      }
    }
    
    # Minimax-Strategie
    ergebnis.each_index {|index|
    ergebnis[index] = ergebnis[index].max} 
     
    ergebnis_min = ergebnis.min
    
    # index der niedrigsten Zahl suchen (find)
    # an dem index steht das richtige Ergebnis --> als rateversuch ausgeben 
    
     
    # Bis es vier Direkte Treffer gibt
    until @black_hits == 4 do
      knuth 
      end
  return knuth
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



# Author:: Emilie Schuller
# Author:: Mara von Kroge
# Mastermind - KI  - Script
require_relative "mastermind_ai.rb"

emi=MasterMindAI.new

puts "Kombination-Mensch eingeben, welche der Computer erraten soll:"
puts emi.kombination_mensch

puts "Nun beginnt der Computer, die Kombination zu erraten."
emi.knuth
puts emi.durchgang