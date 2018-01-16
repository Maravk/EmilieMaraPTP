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
    @amount_of_rounds = 20
    puts "Amount of rounds: #{@amount_of_rounds}"
    
    # Gültiger Zahlenbereich
    @amount_of_numbers = 6
    
    # Die festgelegte Länge einer Ratekombination.
    @length = 4
    puts "Code length: #{@length}"
    @round = 0
    @knuth_guess = [1,1,2,2]
    @guess = []
    @code = []
    @black_hits = 0
    @white_hits = 0
    @remaining_codes = []
    @hits = [[0,0], [0,1], [0,2], [0,3], [0,4], [1,0], [1,1], [1,2], [1,3], [2,0], [2,1], [2,2], [3,0], [3,1], [4,0]]
  end

  def new_game_ai
    @remaining_codes = @codes.clone
    @mmio.print_new_game
    @round = 0
    puts "Now you have to generate your secret code:"
    @code = @mmio.generate_code_human(@length, @elements)
    while (true) do
      if (@round == @amount_of_rounds)
        puts "Reached round #{@round}"
        break
      end
      
      knuth

      @round += 1
    end
    new_game_ai
  end

  # Nur beim ersten Rateversuch
  def knuth
    if @round == 0
      @guess = @knuth_guess.clone
      @codes[7] = nil
      @codes.compact!
    end
    # Bewertung des Versuchs
    hits = @mm.compare_codes(@code,@guess)
    @black_hits = hits[0]
    @white_hits = hits[1]
    puts "Round : #{@round + 1}"
    puts "The code: #{@code}"
    puts "Computer's guess: #{@guess}"
    if @guess == @code
      puts "The Computer solved the code in round #{@round + 1}." 
      new_game_ai
    end
    delete_counter = 0
    
    @remaining_codes.each_index { |index|
      # Werte aus compare_codes werden übertragen
      # Es wird überprüft, ob jeder Code aus der Permutation das selbe Ergebnis an Direkten und Indirekten Treffern erzielt.
      # Wenn nicht, wird der jeweilige Codeindex rausgelöscht, indem er mit nil überschrieben wird.
      hits = @mm.compare_codes(@guess, @remaining_codes[index])
      black_hits = hits[0]
      white_hits = hits[1]
      if black_hits != @black_hits || white_hits != @white_hits
        @remaining_codes[index] = nil
        delete_counter += 1
      end
    }
    puts "Delete counter: #{delete_counter}"
    p @remaining_codes.compact!
    #next_guess
    puts "remaining_codes: #{@remaining_codes.size}"
    simple_guess
    #next_guess
  end

  def simple_guess
  guess = rand(0..(@remaining_codes.size-1))
  @guess  = @remaining_codes[guess]
  @remaining_codes[guess] = nil
  @remaining_codes.compact!
  end

  def next_guess
    all_codes = @codes.dup
    remaining_codes = @remaining_codes.dup
    result = Array.new
    all_codes.each_index {|index|
      result[index] = 0
    }
    all_codes.each_index {|index|
      remaining_codes.each_index {|index2|

        hits = @mm.compare_codes(all_codes[index], remaining_codes[index2])
        black_hits = hits[0]
        white_hits = hits[1]
        if black_hits != @black_hits || white_hits != @white_hits
          result[index] += 1
        end
      }
    }
    #puts "results: #{result}"
    most_deletes = 0
    max_deletes = nil
    result.each_index  {|index|
      if result[index] > most_deletes
        max_deletes = index
      end
    }

    @guess = @codes[max_deletes]
    @codes[max_deletes] = nil
    @codes.compact!
    puts "returned by next_guess: #{@guess}"
    return @guess
  end
    
end