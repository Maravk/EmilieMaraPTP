#Author: Emilie Sarina Schuller, Mara von Kroge
#Fibonacci-Folge
#Variante 2.3

#Text erscheint auf der Konsole und der Nutzer kann eine beliebige postive Zahl eingeben
puts "Guten Tag! Dieses Programm gibt ihnen die n-te Anzahl an Fibonacci-Ziffern aus.\nGeben Sie nun ein, wie viele Fibonacci-Ziffern angezeigt werden sollen!"
eingabe = gets.to_i

#Ist die Zahl kleiner gleich 0, wird der Nutzer aufgefordert, eine positive Zahl einzugeben
if eingabe <=0 
  then puts "Bitte geben Sie eine positive Zahl ein!"
end

#Definition der Fibonacci-Folge: Die je aufeinanderfolgenden Zahlen werden addiert
a = 1
b = 0

#Schleife bis zur n-ten Anzahl der Fibonacci-Folge --> n hat der Nutzer am Anfang selbst gewählt
for n in 1..eingabe do
  c = a + b
  puts c
  a = b
  b = c
end

#a, b und c sind nun alle festgelegt, damit am Ende nur die n-Zahl dargestellt wird
a = 1
b = 0
c = 0
for n in 1..eingabe do
  c = a + b
  a = b
  b = c
end

puts''

puts 'Die ' << eingabe.to_s << 'te Zahl der Fibonacci Folge lautet: ' << c.to_s

