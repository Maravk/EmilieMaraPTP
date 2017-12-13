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
  
  
  # Sofern zeile1 kleiner als die Größe der Variablen Array ist, soll stets für die 2. Zeile ein neues Array erstellt werden.
  while(zeile1 < array.size)
    array2[zeile2] = Array.new
    
    # Ist das Array von zeile1 größer als 1...
    if (array[zeile1].size > 1)
        
      # Zähler für die n-te Ordnung
      i = 1
      
      # Sofern die Länge der ersten Arrayzeile kleiner als i ist, wird eine 0 rangehängt - dies geschieht in der zweiten Arrayzeile
      while (i < array[zeile1].size)
        s = "" << array[zeile1][i].to_s << "0"
        array2[zeile2] << s
        
        # Der Zähler für die n-te Ordnung wird stets hochgezählt
        i += 1
      end
        
      # Die zweite Zeile 
      zeile2 += 1 
        
    # Sofern die Länge der ersten Arrayzeile nicht kleiner als 1 ist, soll sich die zweite Zeile nicht verändern.
    else
      zeile2 = zeile2
    end
      
    # Neues Array der zweiten Zeile
    array2[zeile2] = Array.new
      
    # Vor das 1. Element der zweiten Zeile wird das erste Element der ersten Zeile  inkl. einer 0 gestellt.
    s = "" << array[zeile1][0].to_s << "0"
    array2[zeile2][0] = s
        
    i = 0
        
    # während i kleiner als die Länge der 1. Zeile ist, soll an die i-te Stelle in der ersten Zeile eine 1 platziert werden und dieses Element kommt in die 2. Zeile
    while (i < array[zeile1].size)
      s = "" << array[zeile1][i].to_s << "1"
      array2[zeile2] << s
          
      i += 1
    end
          
          
    zeile2 += 1
    zeile1 += 1     
  end 
  return array2 
end
 
              
              
              
              
# Startwerte für die 1. Ordnung
pattern_1 = Array.new
pattern_1[0] = "0"
pattern_1[1] = "1"
 
# Die nächsten n-ten Ordnungen setzen sich jeweils aus den vorherigen Ordnungen zusammen
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
      printf (" ")
    end 
    puts
  end
end

print(pattern_2) 

  