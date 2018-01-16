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
    
    # Die Anzahl der Runden
    @amount_of_rounds = 10
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

  # Neues Spiel als Codemaker, während der Computer rät.
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

  # Nur beim ersten Rateversuch (Knuth-Guess)
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
    puts "Round: #{@round + 1}"
    puts "The code: #{@code}"
    puts "Computer's guess: #{@guess}\n\n"
    if @guess == @code
      @mmio.computer_win(@round)
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
    @remaining_codes.compact!
    puts "Remaining codes: #{@remaining_codes.size}"
    simple_guess
    #next_guess
  end

  # Nächster Rateversuch
  def simple_guess
  guess = rand(0..(@remaining_codes.size-1))
  @guess  = @remaining_codes[guess]
  @remaining_codes[guess] = nil
  @remaining_codes.compact!
  end
end