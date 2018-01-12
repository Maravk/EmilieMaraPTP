# Author:: Mara von Kroge, Emilie Schuller
# 18. Dezember 2017
# Klasse zu Mastermind - Computer ist Codebreaker

require_relative "mastermind_compare.rb"

class MastermindAI

  attr_reader :rounds_left
  def initialize()
    # Die zur Verfügung stehenden Farben.
    @elements = [1,2,3,4,5,6]

    # Array aus allen möglichen 4-er Farbkombinationen
    @codes = @elements.repeated_permutation(4).to_a

    # Kopie von allen möglichen Varianten
    # UNNOETIGKEIT^2   @set = @codes.dup

    # 10 Runden insgesamt
    @rounds_left = 10

    # Initialguess
    @last_guess = [1,1,2,2]
  end

  # Kombination wird vom Menschen ausgewählt.
  def kombination_mensch
    @kombination_mensch_konsole = gets.chomp.strip.split(" ")
    @kombination_mensch_konsole.map! {|zahl| zahl.to_i}

    p @kombination_mensch_konsole
    # TypeError, falls die Eingabe ungültig ist.
    @kombination_mensch_konsole.each { |zahl|
      raise TypeError, 'Bitte geben Sie eine gültige Farbe als Zahl ein!' if !@elements.include?(zahl)
    }
    return @kombination_mensch_konsole

  end

  def durchgang
    @rounds_left||=10
    
    # Für jeden neuen Durchgang werden die Zähler für die Direkten und Indirekten Treffer auf null gesetzt.
    @black_hits = 0
    @white_hits = 0

    # Initialguess vom Knuth Algorithmus' (1122/pink pink blue blue)
    knuth_guess = knuth

    # Stets werden zwei Codes miteinander verglichen.
    hits = compare_codes(knuth_guess, @kombination_mensch_konsole)
    @black_hits = hits[0]
    @white_hits = hits[1]
    
      # Ausgabe auf die Konsole bezüglich der Anzahl der Direkten und Indirekten Treffer.
      puts "Runden übrig: #{@rounds_left}"
      puts "    Direkte Treffer:   #{@black_hits}"
      puts "    Indirekte Treffer: #{@white_hits}\n\n"
   
   
    @rounds_left+= -1
end

    #RUECKGABE ueberdenken
    # Methode mit Eingaben (vorschlag bekommen) --> bei der menschinteraktion aufrufen -->
    # den Array, den man zurückbekommt, dort darstellen

    # Methode Input des Menschen,

  # Gliederung des Codes
  def manager
    until @rounds_left == 0 || @black_hits == 4 do
    durchgang
    knuth
    next_guess
    end
  end
  
  
  # Knuth Algorithmus
  def knuth

    # 10 Runden
    # Initialguess von Knuth nur beim ersten Versuch
    return @last_guess.clone if @rounds_left == 10

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
        puts "hat was rausgeloescht"
      end
    }
    p @codes.compact!
  end

  def compare_codes(code_one, code_two)
    MastermindCompare.compare_codes(code_one, code_two)
  end

  # Stets der nächste Rateversuch
  def next_guess

    # EVTL UNNOETIG @kombination_mensch_konsole = kombination_mensch

    remaining_possibilities = @codes.dup
    remaining_possibilities2 = @codes.dup
    ergebnis = []

    # So viele Hashes in das Ergebnis-Array, wie lang das Array ist
    remaining_possibilities.length().times do
      ergebnis.push(Hash.new)
    end

    # Jede Kombination wird mit jeder Kombination verglichen.
    remaining_possibilities.each_index {|index|
      remaining_possibilities2.each_index {|index2|
        compare_codes(remaining_possibilities[index], remaining_possibilities2[index2])

        # Der Hash wird stets hochgezählt.
        vergleich = compare_codes(remaining_possibilities[index], remaining_possibilities2[index2])
        if ergebnis[index].has_key?(vergleich)
          ergebnis[index][vergleich] += 1
        else
          ergebnis[index][vergleich] = 1
        end
      }
      max_intern = 0
      ergebnis[index].each_value  {|zahl|
        max_intern = zahl if zahl > max_intern
      }
      ergebnis[index] = max_intern
    }

    min = ergebnis.min()
    next_guess_index = ergebnis.index(min)

    # Nächster Rateversuch (Klone, damit man kann so keine Referenz auf das originale Objekt erhält)
    @last_guess = @codes[next_guess_index]
    @codes[next_guess_index].clone
  end
  
# Für die Tests
  @input = input
end

def change_code(code)
  @code = code
end 


# Author:: Emilie Schuller
# Author:: Mara von Kroge
# Mastermind - KI - Script
require_relative "mastermind_ai.rb"

emi=MastermindAI.new

puts "Kombination-Mensch eingeben, welche der Computer erraten soll:"
puts emi.kombination_mensch

puts "Nun beginnt der Computer, die Kombination zu erraten."
emi.manager