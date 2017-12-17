# Author:: Emilie Schuller
# 11. Dezember 2017
# Mastermind - Kombination bewerten


class MasterMindEvaluation
  class << self
    
    
    # Bewertung der Rateversuche
    def evaluate_guess(guess, code, colors)
      saved_code = code.to_sym
      saved_guess = guess.to_sym
      
      current_guess = saved_guess.to_sym
      current_code = saved_code.to_sym
      
      black = count_black_hits(current_guess, current_code)
      white = count_white_hits(current_guess, current_code, colors)
      [black, white]
    end
    
    # Zähler für die Direkten Treffer
    def count_black_hits(current_guess, current_code)
      black = 0
      (0..3).each {|n| 
        if current_code[n] == current_guess[n]
          black = black + 1
          current_code[n] = block_color
          current_guess[n] = block_color
        end
        }
     return black
  end
  
  # Kennzeichnen der Direkten Treffer
  def block_color
    return "-"
  end
  
  # Zähler für die Indirekten Treffer
  def count_white_hits(current_code, current_guess, colors)
    white = 0
    colors.each {|n|
      white = white + [current_code.count(color), current_guess.count(color).min]
      }
      return white
  end 
  
  
end
end 