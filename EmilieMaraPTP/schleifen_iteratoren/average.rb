# Author:: Emilie Schuller
# 06. Dezember 2017
# Schleifen und Iteratoren

class Average

  def average_with_nil
   @input = gets.chomp.split(" ")
    @input.map! {|zahl| zahl.to_i}
   @input.each do |zahl|
     if zahl == nil
       @input.compact
     if zahl == 0
     @input.delete(0)
     end
     end
     end
 
    raise TypeError, "Please enter a valid number" if !@input.each {|zahl| zahl.instance_of?(Integer)}
  end 
  
  
  def output
   sum = @input.inject(0, :+)
   ergebnis = sum/@input.length
   puts ergebnis
 
  end
end 