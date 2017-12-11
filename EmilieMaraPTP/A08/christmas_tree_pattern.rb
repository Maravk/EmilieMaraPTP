# Author:: Anastasiya Vladimirova
# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# Christmas Tree Pattern

  
  # Methode für den Algorithmus
  def tree(array_1)
    array = array_1
    zeile1 = 0
    array2 = Array.new
    zeile2 = 0
    
   
    while(zeile1 < array.size)
      array2[zeile2] = Array.new
        if (array[zeile1].size > 1)
          i = 1
          
          
          # Sofern die Länge der ersten Arrayzeile kleiner als i ist, wird eine 0 rangehängt - dies geschieht in der zweiten Arrayzeile
          while (i < array[zeile1].size)
            s = "" << array[zeile1][i].to_s << "0"
            array2[zeile2] << s
            
            # Der Zähle für die n-te Ordnung wird stets hochgezählt
            i += 1
            end
            
            # Die zweite Zeile 
            zeile2 += 1 
            
            # Sofern die Länge der ersten Arrayzeile nicht kleiner als 1 ist, soll sich die zweite Zeile nicht verändern
            else
              zeile2 = zeile2 
          end 
          
          
       # if (array[zeile1][0] != "")
          array2[zeile2] = Array.new
            s = "" << array[zeile1][0].to_s << "0"
            array2[zeile2][0] = s
            
            i = 0
            
            while (i < array[zeile1].size)
              s = "" << array[zeile1][i].to_s << "1"
              array2[zeile2] << s
              
              i += 1
              end
              
              
             # zeile2 += 2 
              
              #else 
                zeile2 += 1
               # end 
                zeile1 += 1     
                end 

                return array2 
end 
   
                
                
                
                
# Startwerte für die 1. Ordnung
pattern_1 = Array.new
 pattern_1 << Array.new()
   pattern_1[0] = "0"
   pattern_1[1] = "1"
   
   pattern_2 = tree(pattern_1)
   pattern_3 = tree(pattern_2)
   pattern_4 = tree(pattern_3)
   pattern_5 = tree(pattern_4)
   pattern_6 = tree(pattern_5)
   pattern_7 = tree(pattern_6)
   pattern_8 = tree(pattern_7)

  
                
   
# Methode für die formatierte Ausgabe      
  def print(array)
    word_size = array[1][0].to_s.length
    space = " "*(word_size + 1) 
    
    array.each do |first_array|
      size = first_array.length
      size = (word_size + 1 - size) / 2
      printf(space * size)
      first_array.each do |element|
        printf element.to_s
      printf (" ")end 
      
      puts 
      
    end 
end 

      print(pattern_8) 

  