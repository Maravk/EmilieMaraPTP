# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# Christmas Tree Pattern Klasse


#require 'combinatorics/permutation'

class ChristmasTreePattern
  include Combinatorics::Permute 
  
  
  # getting the input concerning the length of the pattern from the user
  def input
    @input = gets.chomp
    
    # evaluating the length of the combination through the binomial coefficient
    # n C (n-2)
    @length=(1+@input-(@input/2)..n).inject(:*)/(1..(@input/2)).inject(:*) + 1
  end
  
  def pattern
    # algorithmus ralle ich noch nicht ganz xD
    if @length == 2
      puts "0 1"
    end 
        if @length == 2
            puts "10"
              "00 01 11"
        end
  end
end
  
  

emi=ChristmasTreePattern.New
emi.input(2)