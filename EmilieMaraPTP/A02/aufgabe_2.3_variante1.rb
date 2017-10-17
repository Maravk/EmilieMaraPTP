#Author: Emilie Sarina Schuller, Mara von Kroge, 16. Oktober 2017
#Fibonacci-Folge
#Variante 2.3.1

#Ein Text erscheint auf der Konsole und der Nutzer kann eine beliebige postive Zahl eingeben.
puts "Guten Tag! Dieses Programm gibt Ihnen die n-te Anzahl an Fibonacci-Ziffern aus.\nGeben Sie nun ein, wie viele Fibonacci-Ziffern angezeigt werden sollen!"
eingabe = gets.to_i

#Ist die Zahl kleiner gleich 0, wird der Nutzer aufgefordert, eine positive Zahl einzugeben.
if eingabe <=0 
  then puts "Bitte geben Sie eine positive Zahl ein!"
end

#Die Startwerte für die Fibonacci-Folge werden mit 0 und 1 festgelegt.
a = 1
b = 0

#Eine for-Schleife bis zur n-ten Anzahl der Fibonacci-Folge wird generiert --> n hat der Nutzer am Anfang selbst gewählt.
#Definition der Fibonacci-Folge: Die je aufeinanderfolgenden Zahlen werden addiert.
for n in 1..eingabe do
  c = a + b
  puts c
  a = b
  b = c
end

#Das Programm gibt in einem String die jeweils letzte Fibonacci-Ziffer aus. 
puts "\nDie " + eingabe.to_s + "te Zahl der Fibonacci Folge lautet: " + c.to_s
