# Author:: Emilie Schuller
# 12. Dezember 2017
# Mastermind - Computer spielt

require_relative 'message_center'
require_relative 'mastermind_computer_ai'
require_relative 'mastermind_evaluation'
require_relative 'validity'


# Game-Klasse
class Game
  include Validity

  COLORS = ["pink", "blue", "yellow", "green", "grey", "red"]


  def initialize
    computer_ai = ComputerAI.new(COLORS)
    @players = [computer_ai]
  end


 # Farbenkombination wird ausgewählt
  def get_code(code_maker)
    player = @players[code_maker - 1]
    player.choose_code
  end

  # Zähler für 10 Runden
  # Rateversuche werden bewertet
  def get_guesses(guesser, secret_code, is_command_line = false)
    counter, scores, guesses = 1, [], []
    until game_over?(scores, counter)
      guess = get_guess(guesser, scores.first, scores.last, guess)
      scores = check_guess(guess,secret_code)
      guesses <<  [guess, scores.first, scores.last]
      display_scores(guesses.last, counter) if is_command_line
      counter += 1

    end
   return guesses
  end


  # Rateversuch
  def get_guess(guesser, black, white, guess)
    player = @players[guesser - 1]
    player.get_guess(black, white, guess)
  end


  # Bewertung des Rateversuches
  def check_guess(guess, secret_code)
    GuessChecker.check_guess(guess, secret_code, COLORS)
  end


  # Wenn das Spiel vorbei ist
  # Entweder ist die Kombination richtig oder die 10 Runden sind vorbei.
  def game_over?(scores, counter)
    return true if scores == [4,0]
    return true if counter > 10
    false
  end

  #
  def secret_code_message
    MessageCenter.secret_code_message
  end

  # Ungültige Eingabe
  def invalid_selection_message
    MessageCenter.invalid_selection_message
  end

  # Der Gewinner wird angezeigt.
  def game_over_message(guesses)
    final_scores = [guesses.last[1], guesses.last[2]]
    if final_scores == [4,0]
      MessageCenter.player_two_wins_message
    else 
      MessageCenter.player_one_wins_message
    end
  end

end
