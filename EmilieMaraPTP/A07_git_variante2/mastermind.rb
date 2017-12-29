# Author:: Mara von Kroge, Emilie Schuller
# TeamChallenger
# 27. Dezember 2017
# Klasse zu Mastermind - Computer ist Codebreaker

class Game
# Die zur Verfügung stehenden Farben
  COLORS = ["red", "yellow", "blue", "pink", "grey", "green"]

    
  def initialize
    @comp = Computer.new
    @player = Player.new
  end


  # Spiel startet
  def play
    
    # 10 Runden
    10.times do |i|
      puts "This is chance #{i+1} of 10"
      
      # Spieler gibt einen Code ein.
      current_guess = @player.guess_code
      
      # Code wird bewertet.
      standing = evaluate_guess(current_guess)

      # 4 Direkte Treffer
      if standing[:exact].length == 4
        puts "You won!"
        return
        exit
      else
        # Ausgabe für die Anzahl der direkten und indirekten Treffer.
        puts "#{standing[:exact].length} Exact Matches"
        puts "#{standing[:near].length} Near Matches"
      end
    end

    # 10 Runden sind vorbei und man hat den Code nicht erraten.
    puts "You lost!"
    return
  end

  # Bewertung des Rateversuches
  def evaluate_guess(current_guess)
    
    # Zwei Hashes
    results = { :exact => [], :near => [] }
      
    # Direkter Treffer - Farbe und Position
    current_guess.each_with_index do |choice, position|
      if exact_match?(choice, position)
        results[:exact] << true
          
      # Indirekter Treffer
      elsif near_match?(choice)
        results[:near] << true
      end
    end
    results
  end

  # Methode für den indirekten Treffer - nur Farbe ist enthalten, aber Position ist falsch.
  def near_match?(choice)
    @comp.code_combination.include?(choice)
  end

  # Methode für den direkten Treffer - Farbe und Position ist richtig.
  def exact_match?(choice, position)
    choice == @comp.code_combination[position]
  end
end


# Klasse für den Computer
class Computer
  attr_reader :code_combination

  def initialize
    @code_combination = code
  end


  def code
    # Eine zufällig gewählte Viererkombination der verfügbaren Farben wird als nächster Rateversuch getestet.
    colors = Game::COLORS.sample
    generated_code = []
    4.times{ generated_code << colors.pop }
    generated_code
  end
end



class Player
  def guess_code
    puts 'What is your guess? Choose one of the following: red, yellow, blue, pink, grey, green!'
    converted_guess(gets.chomp)
  end

  #
  def converted_guess(guess)
    guess.split('')
  end
end