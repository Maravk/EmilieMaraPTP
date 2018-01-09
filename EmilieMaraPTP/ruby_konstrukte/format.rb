# Author:: Emilie Schuller
# 07. Januar 2017
# Input mit Tausenderpunkten anzeigen


class Format
  def input
    puts "Hello! This programm will print your input-integer with thousand points."
    puts "Your input:"
    @input = gets.chomp.to_i
    
      raise ArgumentError, "Please enter an integer!" if !@input.instance_of?(Integer)
      raise ArugmentError, "Please enter an integer!" if @input + 1 - 1 != @input

      if @input == 0
      @input.delete(0)
    end
    
  end

  def format
   printf sprintf("%8.3f", @input)
#    @input = @input.to_s.split("")
#    length = @input.size
#    length = length/3
#    @input.reverse.gsub!
#  } 
    # alle drei stellen einen Punkt einfügen
    #puts @input  
  end

end 

emi = Format.new
emi.input
emi.format