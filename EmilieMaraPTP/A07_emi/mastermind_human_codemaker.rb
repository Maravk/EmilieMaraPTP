# Author:: Emilie Schuller
# Author:: Mara von Kroge
# TeamChallenger
# Mastermind - Human - Codemaker

require_relative "mastermind_io"
require_relative "mastermind_compare"
require_relative "mastermind_rules"


class MasterMindHumanCodemaker
  
  self.input_human_codemaker
  self.check_combinaiton_human_codemaker
  
  def input_computer_codemaker
    @code_computer = []
      i = 0
      while (i < @length) do
        @code_computer.push(rand(1..6))
        i += 1
      end
      return @code_computer
   end
   
end