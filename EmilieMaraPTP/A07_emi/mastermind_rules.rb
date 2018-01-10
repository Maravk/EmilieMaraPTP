# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# Mastermind - Rules

class MasterMindRules
  
  def elements
    @elements = [1,2,3,4,5,6]
  end
  
  def repeated_permutation
    @codes = @elements.repeated_permutation(4).to_a
  end 
  
  def rounds_left
    @rounds_left = 10 
  end  
  
  def knuth_guess
    @knuth_guess = [1,1,2,2]
  end 
end