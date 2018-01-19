# Author:: Emilie Schuller
# 06. Dezember 2017
# Schleifen und Iteratoren

class Average

  def average_with_nil
   @input = gets.chomp.split(" ")
    @input.map! {|zahl| zahl.to_i}
    @input.delete(0)
    raise TypeError, "Please enter a valid number" if !@input.each {|zahl| zahl.instance_of?(Integer)}
  end 
  
  def output
   sum = @input.inject(0, :+)
   ergebnis = (sum/@input.length).to_f
   puts ergebnis
 
  end
end 