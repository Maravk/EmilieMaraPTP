# Author:: Emilie Schuller
# Author:: Mara von Kroge
# TeamChallenger
# Mastermind - AI - Codebreaker

require_relative 'mastermind_io.rb'

class MastermindAICodebreaker
  def initialize(length_of_code, amount_of_numbers, amount_of_rounds)
    
    # Die zur Verfügung stehenden Zahlen
    @elements = [*1..6]
    @codes = @elements.repeated_permutation(4).to_a
    puts "Valid Elements: #{@elements}"
    
    # Die Anzahl der Runden
    @amount_of_rounds = amount_of_rounds
    puts "Amount of rounds: #{@amount_of_rounds}"
    @amount_of_numbers = amount_of_numbers
    
    # Die festgelegte Länge einer Ratekombination.
    @length = length_of_code
    puts "Code length: #{@length}"
    @mmio = MastermindIO.new
    @rounds_left = 10
    @knuth_guess = [1,1,2,2]
  end

def new_game_ai
  @mm.print_new_game
  @round = 0
  knuth
  next_guess
end


  # Nur beim ersten Rateversuch
  def knuth
     @last_guess == @knuth_guess.clone if @rounds_left == 10
      
    # Bewertung des Versuchs
    @codes.each_index { |index|

      # Werte aus compare_codes werden übertragen
      # Es wird überprüft, ob jeder Code aus der Permutation das selbe Ergebnis an Direkten und Indirekten Treffern erzielt.
      # Wenn nicht, wird der jeweilige Codeindex rausgelöscht, indem er mit nil überschrieben wird.
      emi = MasterMindCompare.new
      hits = compare_codes(@last_guess, @codes[index])
      black_hits = hits[0]
      white_hits = hits[1]
      if black_hits != @black_hits && white_hits != @white_hits
        @codes[index] = nil
        puts "Hat etwas rausgeloescht."
      end
    }
    p @codes.compact!
  end

       
    def next_guess
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
    return @codes[next_guess_index].clone
    end
    
end