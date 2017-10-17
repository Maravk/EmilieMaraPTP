#Author: Emilie Sarina Schuller, Mara von Kroge, 12. Oktober 2017
#Fibonacci-Folge
  #Variante 2.1



def fibonacci(f)
  if f == 1
    1
  elsif f == 2
      2
  else
      fibonacci(f-2)+fibonacci(f-1)
    end
  end
 
  print fibonacci(10)
  
puts "Die #{f}'te Zahl der Fibonacci-Folge lautet wie folgt!"