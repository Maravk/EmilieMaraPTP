# Author:: Emilie Schuller
# Author:: Mara von Kroge
# TeamChallenger
# Mastermind

require_relative 'mastermind_io.rb'

class Mastermind
  
  def initialize(length_of_code, amount_of_numbers, amount_of_rounds)
    # Die zur Verfügung stehenden Zahlen
    @elements = [*1..amount_of_numbers]
    puts "Valid Elements: #{@elements}"
    
    # Die Anzahl der Runden
    @amount_of_rounds = amount_of_rounds
    puts "Amount of rounds: #{@amount_of_rounds}"
    @amount_of_numbers = amount_of_numbers
    
    # Die festgelegte Länge einer Ratekombination.
    @length = length_of_code
    puts "Code length: #{@length}"
    @amount_of_rouds = amount_of_rounds
    @mmio = MastermindIO.new
    @round = 0
  end
  
  def new_game
    @mmio.print_new_game
    @round = 0
    generate_code
    game_loop
  end
  
  
  # Vierstellige Kombination des Computers wird zufällig generiert.
  def generate_code
    @code = Array.new
    a = 0
    while(a < @length) do
      @code[a]= rand(1..@amount_of_numbers).to_s
      a += 1
    end
      return @code
  end
  
  def game_loop
    # Eingabe des Users
    protocol = []
    # Direkte Treffer
    black_hits = []
    # Indirekte Treffern  
    white_hits = []
    
    while (true) do
      # Eingabe des Menschen.
      
      @input = @mmio.input_code(@code, @elements)
      # Für jeden neuen Durchgang werden die Zähler für die Direkten und 
      # indirekten Treffer auf null gesetzt.
      @black_hits = 0
      @white_hits = 0
      
      # Stets werden zwei Codes miteinander verglichen. 
      hits = compare_codes(@code, @input)
      @black_hits = hits[0]
      @white_hits = hits[1]
      
      # Jeweils pro Runde neuer Input, neue Anzahl an Black und White Hits.
      protocol[@round] = @input
      black_hits[@round] = @black_hits
      white_hits[@round] = @white_hits
      
      @mmio.table(@round, protocol, black_hits, white_hits)
      
      # Spiel gewonnen, sobald vier Direkte Treffer erzielt wurden.
      if @black_hits == 4
        puts "THE CODE HAS BEEN SOLVED!!!"
        while(1) do
          
          # Neues Game.
           puts "Do you want to play another game? (y/n)"
           a = gets.chomp
           if a == "y"
             new_game
           elsif a == "n"
             exit
           end
        end
      end
      @round += 1
      
      # Bis alle Runden vorbei sind.
      if @round == @amount_of_rounds
        puts "#{@amount_of_rounds} out of #{@amount_of_rounds} rounds. You lost! ^_^"
        puts "The code was: " + @code.to_s
        break
      end
    end
    
    while(1) do
      puts "Do you wanna play another game? (y/n)"
      a = gets.chomp
      if a == "y"
        new_game
      elsif a == "n"
        exit
      end
    end        
  end


  # Vergleicht zwei Codes 
  # Rückgabe der Anzahl der Direkten und Indirekten Treffer
  def compare_codes(solution, guess)
    
    # Klone werden erstellt, damit der originale Inhalt nicht verändert wird.
    code1 = solution.clone
    code2 = guess.clone
    black_hits = 0
    white_hits = 0

    # Direkte Treffer
    # Stellen der Treffer werden mit ungültigen Werten überschrieben, 
    # um wiederholte Zählung bei Indiekten Treffern zu vermeiden.
    code1.each_index { |index|
      if code1[index] == code2[index]
        code1[index] = 0
        code2[index] = -1
        black_hits += 1
      end
    }

    # Indirekte Treffer
    # Stellen der Treffer werden mit ungültigen Werten überschrieben, 
    # um wiederholte Zählung zu vermeiden.
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
  
  # Für die Tests
  def change_input(input)
    @input = input
  end
  
  def change_code(code)
    @code = code
  end 
  
end
