# Author:: Emilie Schuller
# 22. Januar 2018
# Ungerade Zahlen als Start- und Endwert für ein Range

class Range
  include Comparable
  def initialize(number1, number2)
    
    # Überprüfung der Parameter
    raise ArgumentError, "Please enter odd integers." if !number1.instance_of?(Integer) || !number2.instance_of?(Integer)
    raise ArgumentError, "Please enter odd integers." if number1 % 2 == 0 || number2 % 2 == 0
    raise ArgumentError, "The integers aren't allowed to be identical." if number1 == number2
    @number1 = number1
    @number2 = number2
  end
  
  # Range markieren
  def set_range
    
    # Range Variante 1
    if @number1 < @number2
      @range = (@number1..@number2).to_a
      @range.delete_if{|number| number % 2 == 0}
      puts "Range = #{@number1..@number2}"
      puts "Range als Array: #{(@range).to_a}"

      # Range Variante 2
    else
      @range = (@number2..@number1).to_a
      @range.delete_if{|number| number % 2 == 0}
      puts "Range = #{@number2..@number1}"
      puts "Range als Array: #{(@range).to_a}"
      puts "Anzahl der Elemente: #{@range.count}"
    end
  end
  
  # Überprüfen, ob das Range korrekt erstellt wurde
  def check_range
    puts "\nBeispiel 1 aus dem Range: #{example = @range.sample}"
    puts "Beispiel 2 aus dem Range: #{example1 = @range.sample}"
    puts "\nVergleich beider Range-Examples: #{example} <=> #{example1} ergibt #{example <=> example1}"
  end
end

emi = Range.new(39,81)
puts emi.is_a?(Range)
emi.set_range
emi.check_range