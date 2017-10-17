#Author: Emilie Sarina Schuller, Mara von Kroge
#Fibonacci-Folge
#Variante 2.3

puts "Guten Tag! Dieses Programm gibt ihnen die n-te Anzahl an Fibonacci-Ziffern aus.\nGeben Sie nun ein, wie viele Fibonacci-Ziffern angezeigt werden sollen!"
eingabe = gets.to_i
if eingabe <=0 
  then puts "Bitte gib eine positive Zahl ein, du Dööödel"
end

a = 1
b = 0
for n in 1..eingabe do
  c = a + b
  puts c
  a = b
  b = c
end

a = 1
b = 0
c = 0
for n in 1..eingabe do
  c = a + b
  a = b
  b = c
end
puts 'Die ' << eingabe.to_s << 'te Zahl der Fibonacci Folge ist: ' << c.to_s

#puts "Hier sehen Sie nun die #{eingabe} ersten Fibonacci-Ziffern!" 