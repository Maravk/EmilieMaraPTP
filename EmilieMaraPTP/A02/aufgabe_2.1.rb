#Author: Emilie Sarina Schuller, 12. Oktober 2017
#Fibonacci-Folge
  #Variante 2.1

a = 1
b = 0
for n in 1..30 do
c = a + b
puts c
a = b
b = c
end