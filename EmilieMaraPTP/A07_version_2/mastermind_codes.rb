# Author:: Emilie Schuller
# 12. Dezember 2017
# Mastermind - alle Kombination 


require_relative "mastermind_evaluation"

class MastermindCodes
  
  attr_accesssor :combinations, :colors
  
  def initialize(colors)
    @colors = colors
    all_combinations
  end
  
  # Alle möglichen Farbkombinationen (1296)
  def all_combinations
    @combinations = @colors.repeated_permutation(4).to_a
    @combinations.each_with_index { |combination, index|
      @combinations[index] = "#{combination[0]} #{combination[1]} #{combination[2]} #{combination[3]}"
    }
  end
  
  # Zähler für Direkte und Indirekte Treffer immer erneueren
  def new_hits_counter(black, white, guess)
    new_combinations = Array.new
    saved_guess = guess.to_sym
    @combinations.each {|possible_guess|
      current_scores = compare_possible_guess_to_current_guess(saved_guess, possible_guess)
      blackcounter = current_scores.first
      whitecounter = current_scores.last
      
      if possibility_has_correct_number_of_colors?(black, blackcounter, white, whitecounter)
        new_combinations.push(possible_guess)
      end
    } 
    @combinations = new_combinations
  end 
  
  
  # Tatsächliche Kombination wird mit geratener Kombination verglichen
  def compare_possible_guess_to_current_guess(saved_guess, possible_guess)
    MastermindEvaluation.evaluate_guess(saved_guess, possible_guess, @colors)
  end
  
  # Geratene Kombination ist richtig?
  def possibility_has_correct_number_of_colors?(black, blackcounter, white, whitecounter)
    blackcounter == black
    whitecounter == white
  end 
  
end