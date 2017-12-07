# Author:: Anastasiya Vladimirova
# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# Christmas Tree Pattern Klasse

class ChristmasTreePattern
  
  
  # getting the input concerning the length of the pattern from the user
  def input
    @input = gets.chomp.to_i
    
    # evaluating the length of the combination through the binomial coefficient
    # n C (n-2)
    @length=(1+@input-(@input/2)..@input).inject(:*)/(1..(@input/2)).inject(:*) + 1
  end
  
  # Algorithmus
  def pattern
    eingabe = gets.chomp
    eingabe.times do
      
    # Leeres Array, mit 0 und 1
      array=[]
      array[0]="0"
      array[1]="1"
      
      # Ist die Arraylänge kleiner zwei, wird an die erste Arraystelle eine 0 und an die zweite Arraystelle eine 1 rangehängt
      if array[0].size < 2 && array[1].size < 2
        array[0].push("0") && array[1].push("1")
      end 
      
      # Ist die Arraylänge größer zwei, werden zwei neue Zeilen erstellt.
      # Für die erste Zeile wird das letzte Element genommen und eine 1 wird rangehängt
      if array.size > 2 
       
          array[1].unshift("1")
          puts
          
          # In der neuen Zeile wird an das erste Element eine 1 rangehängt, an das Erste dann in der nächsten Zahl quasi eine 1 und dann an das letzte Element eine 1
          array[0].push("1") && array[0].push("1") && array[1].push("1")
      end 
      
      # End von der eingabe.times do
        end 
        
   # End von der Methode
   end
end
  
  

emi=ChristmasTreePattern.new
emi.pattern