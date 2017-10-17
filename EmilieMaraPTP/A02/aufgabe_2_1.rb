#Author: Emilie Sarina Schuller, Mara von Kroge, 12. Oktober 2017
#Fibonacci-Folge
#Variante 2.1

#Neue Klasse wird geschrieben
class Aufgabe_2_1

    #Methode fibonacci wird definiert
    def fibonacci(f)
      
      #Schleife wird generiert und die Startwerte werden auf 0 und 1 gesetzt
      if f == 1
        1
      elsif f == 0
        0
      else
        
        #Definition der Fibonacci-Folge
        fibonacci(f-2)+fibonacci(f-1)
      end
    end


end