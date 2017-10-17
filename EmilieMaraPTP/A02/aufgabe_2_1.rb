#Author:: Emilie Sarina Schuller, Mara von Kroge, 12. Oktober 2017
#Fibonacci-Folge
  #Variante 2.1

#Eine neue Klasse wird geschrieben.
class Aufgabe_2_1

    #Die Methode "fibonacci" wird definiert.
    def fibonacci(f)
      
      #Eine if-Schleife wird generiert und die Startwerte werden auf 0 und 1 gesetzt.
      if f == 1
        1
      elsif f == 0
        0
      else
        
        #Die Definition der Fibonacci-Folge erfolgt hier.
        fibonacci(f-1)+fibonacci(f-2)
      end
    end


end