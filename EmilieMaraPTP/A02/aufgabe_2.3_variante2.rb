#Author:: Emilie Sarina Schuller, Mara von Kroge, 17. Oktober 2017
#Fibonacci-Folge
#Variante 2.3.2

#Ausgabe auf der Konsole, welche den Nutzer dazu auffordert, eine beliebige positive Zahl einzugeben.
puts "Guten Tag! Bitte geben Sie eine beliebige positive Zahl Ihrer Wahl\nein und Sie erhalten die jeweilige Stelle in der Fibonacci-Folge!"
eingabe = gets.chomp
eingabe = eingabe.to_i

#Sofern die Eingabe kleiner gleich Null ist, wird der Nutzer aufgefordert, eine positive Zahl einzutippen.
if eingabe <= 0
  then puts "Bitte geben Sie eine beliebige positive Zahl Ihrer Wahl ein!"
end

#Eine neue Methode "fibo" wird definiert, welche für die Berechnung der Fibonacci-Zahlen zuständig ist.
def fibo(n)
  
  #Sofern n < 2 ist, sollen die Werte, also 0 und 1, ausgegeben werden.
  return n if n < 2
  fibo(n-2)+fibo(n-1)
end

#Alle Fibonacci-Zahlen bis zu dem Wert der Eingabe werden augegeben.
(1..eingabe).each {|n| puts fibo(n)}
  puts ''
  
#Die Konsole gibt die FIbonacci-Zahl an der jeweiligen Stelle aus.
  puts "Die #{eingabe}-te Fibonacci-Zahl lautet:" 
(eingabe..eingabe).each {|n| puts fibo(n)}
  