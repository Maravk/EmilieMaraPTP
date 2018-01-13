# Author:: Emilie Schuller
# Author:: Mara von Kroge
# TeamChallenger
# Mastermind

require_relative 'mastermind_io.rb'
require_relative 'mastermind.rb'

class Mastermind
  
  def initialize(length_of_code, amount_of_numbers, amount_of_rounds)
    @mmio = MastermindIO.new
    
    # Die zur Verfügung stehenden Zahlen
    @elements = [*1..amount_of_numbers]
    @mmio.print_valid_elements(@elements)
    
    # Die Anzahl der Runden
    @amount_of_rounds = amount_of_rounds
    
    # Die Anzahl der Nummern
    @amount_of_numbers = amount_of_numbers
    
    # Die festgelegte Länge einer Ratekombination.
    @length = length_of_code
    
    # Start bei Runde 0
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
        @mmio.win
      end
      @round += 1
      
      # Bis alle Runden vorbei sind.
      if @round == @amount_of_rounds
        @mmio.lost(@code, @round, @amount_of_rounds)
        break
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

    code1.each {|number| if code2.include?(number)
      white_hits += 1
    end
    }    
      white_hits = black_hits - white_hits 
    
    #    code1.each_index { |index1|
#      code2.each_index { |index2|
#        if code1[index1] == code2[index2]
#          code1[index1] = 0
#          code2[index2] = -1
#          white_hits += 1
#        end
#      }
#    }
    
    # Rückgabe eines Arrays
    # Direkte Treffer stehen beim 0. Index
    # Indirekte Treffer stehen beim 1. Index
   return [black_hits, white_hits]
  end
end
