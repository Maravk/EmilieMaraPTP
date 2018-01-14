# Author:: Emilie Schuller
# Author:: Mara von Kroge
# TeamChallenger
# Mastermind - AI - Codebreaker

require_relative 'mastermind_io.rb'
require_relative 'mastermind.rb'

class MastermindAICodebreaker
  # mmio: Übergabe des MastermindIO Objekts
  def initialize(mmio)
    @mmio = mmio
    @mm = Mastermind.new(4, 6 , 10, mmio)
    # Die zur Verfügung stehenden Zahlen
    @elements = [*1..6]
    @codes = @elements.repeated_permutation(4).to_a
    puts "Valid Elements: #{@elements}"
    
    # Die Anzahl der Runden die Knuth erlaubt sind
    @amount_of_rounds = 100
    puts "Amount of rounds: #{@amount_of_rounds}"
    
    # Gültiger Zahlenbereich
    @amount_of_numbers = 6
    
    # Die festgelegte Länge einer Ratekombination.
    @length = 4
    puts "Code length: #{@length}"
    @round = 0
    @knuth_guess = [1,1,2,2]
    @last_guess = []
    @code = []
  end

  def new_game_ai
    @mmio.print_new_game
    @round = 0
    puts "Now you have to generate your secret code:"
    @code = @mmio.generate_code_human
    while (true) do
      if (@round == @amount_of_rounds)
        puts "Reached round #{@round}"
        break
      end
      
      knuth
      next_guess
      @round += 1
    end
  end

  # Nur beim ersten Rateversuch
  def knuth
    if @round == 0
      @last_guess = @knuth_guess.clone
    end
    # Bewertung des Versuchs
    hits = @mm.compare_codes(@code,@last_guess)
    @black_hits = hits[0]
    @white_hits = hits[1]
    puts "Round : #{@round + 1}"
    puts "The code: #{@code}"
    puts "Last guess: #{@last_guess}"
    if @last_guess == @code
      puts "The Computer solved the code in round #{@round + 1}." 
      exit
    end
    delete_counter = 0
    @codes.each_index { |index|

      # Werte aus compare_codes werden übertragen
      # Es wird überprüft, ob jeder Code aus der Permutation das selbe Ergebnis an Direkten und Indirekten Treffern erzielt.
      # Wenn nicht, wird der jeweilige Codeindex rausgelöscht, indem er mit nil überschrieben wird.
      hits = @mm.compare_codes(@last_guess, @codes[index])
      black_hits = hits[0]
      white_hits = hits[1]
      if black_hits != @black_hits && white_hits != @white_hits
        @codes[index] = nil
        delete_counter += 1
      end
      
    }
    puts "Delete couter: #{delete_counter}"
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
        #@mm.compare_codes(remaining_possibilities[index], remaining_possibilities2[index2])

        # Der Hash wird stets hochgezählt.
        vergleich = @mm.compare_codes(remaining_possibilities[index], remaining_possibilities2[index2])
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

    # Nächster Rateversuch (Klone, damit man so keine Referenz auf das originale Objekt erhält)
    @last_guess = @codes[next_guess_index]
    return @codes[next_guess_index].clone
  end
    
end