# Author:: Emilie Schuller
# 07. Januar 2017
# Summe aller Elemente

class Summen

  def input
    puts "Hello! This programm will summ all your inputs!"
    puts "Your input (Integer), seperated by blankspace:"
    @input = gets.chomp.split(" ")
    @input.map! {|zahl| zahl.to_i}
      
    # Überprüfung
    @input.each do |zahl|
      raise ArgumentError, "Please enter an integer!" if !zahl.instance_of?(Integer)
      raise ArugmentError, "Please enter an integer!" if zahl + 1 - 1 != zahl
      if zahl == 0
        @input.delete(0)
    end
    end
  end
  
  # Berechnung und Ausgabe
  def sum
   sum = @input.sum
   puts "Here's your sum: #{sum}!"
  end
end

emi = Summen.new
emi.input
emi.sum