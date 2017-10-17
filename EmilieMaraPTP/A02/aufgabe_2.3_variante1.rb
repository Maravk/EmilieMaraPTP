#Author: Emilie Sarina Schuller, Mara von Kroge
#Fibonacci-Folge
#Variante 2.3.1

#Ein Text erscheint auf der Konsole und der Nutzer kann eine beliebige postive Zahl eingeben.
puts "Guten Tag! Dieses Programm gibt Ihnen die n-te Anzahl an Fibonacci-Ziffern aus.\nGeben Sie nun ein, wie viele Fibonacci-Ziffern angezeigt werden sollen!"
eingabe = gets.to_i

#Ist die Zahl kleiner gleich 0, wird der Nutzer aufgefordert, eine positive Zahl einzugeben.
if eingabe <=0 
  then puts "Bitte geben Sie eine positive Zahl ein!"
end

#Definition der Fibonacci-Folge: Die je aufeinanderfolgenden Zahlen werden addiert.
a = 1
b = 0

#Eine for-Schleife bis zur n-ten Anzahl der Fibonacci-Folge wird generiert --> n hat der Nutzer am Anfang selbst gewählt.
for n in 1..eingabe do
  c = a + b
  puts c
  a = b
  b = c
end

#Durch die folgenden zwei Codezeilen wir nur die jeweils zuletzt generierte Zahl der Fibonacci-Folge dargestellt.
for n in eingabe..eingabe
  puts c

#Leerzeichen
puts''

#Das Programm gibt in einem String die jeweils letzte Fibonacci-Ziffer aus. 
puts "Die " +eingabe.to_s+ "te Zahl der Fibonacci Folge lautet: "+c.to_s
end 