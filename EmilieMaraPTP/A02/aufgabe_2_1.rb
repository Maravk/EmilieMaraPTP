#Author: Emilie Sarina Schuller, Mara von Kroge, 12. Oktober 2017
#Fibonacci-Folge
#Variante 2.1
class Aufgabe_2_1

    
    def fibonacci(f)
      
      if f == 1
        1
      elsif f == 0
        0
      else
        fibonacci(f-2)+fibonacci(f-1)
      end
    end


end