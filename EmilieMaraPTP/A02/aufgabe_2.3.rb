#Author: Emilie Sarina Schuller, Mara von Kroge
#Fibonacci-Folge
  #Variante 2.3

puts "Guten Tag! Dieses Programm gibt ihnen die n-te Anzahl an Fibonacci-Ziffern aus.\nGeben Sie nun ein, wie viele Fibonacci-Ziffern angezeigt werden sollen!"
eingabe = gets.to_i

a = 1
b = 0
for n in 1..eingabe do
c = a + b
puts c
a = b
b = c
end

puts "Hier sehen Sie nun die #{eingabe} ersten Fibonacci-Ziffern!" 