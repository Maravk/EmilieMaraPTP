# Author: Emilie Schuller
# 13. Dezember 2017
# MasterMind - Main

require_relative "mastermind_codes.rb"
require_relative "mastermind_computer_ai.rb"
require_relative "mastermind_evaluation.rb"

class ComputerAI
  def initialize (code_list, colors)
    @code_list = Codes.new(colors)
  end

  # Computer wählt einen Code aus. 
  def select_secret_code
    @code_list.possibilities.sample
  end

  # Counter für Direkte und Indirekte Treffer wird geupdatet.
  def get_guess(black, white, guess)
    @code_list.update_list(black, white, guess) unless guess.nil?
    @code_list.possibilities.sample
  end
  
end