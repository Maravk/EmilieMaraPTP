#Author:: Emilie Sarina Schuller, Mara von Kroge, 17. Oktober 2017
#Skript zu Aufgabe 2.1

#Klasse aus aufgabe_2_1 wird angefordert.
require_relative 'aufgabe_2_1' 

#Ein neues Objekt der Klasse wird erstellt.
fibonacci_object = Aufgabe_2_1.new

#Die Eingabe des Nutzers erfolgt nun.
print "Bitte geben Sie eine positive Zahl Ihrer Wahl ein: "
f = gets.to_i

#Die f-te Zahl der Fibonacci-Folge wird ausgegeben.
print "Die #{f}-te Zahl der Fibonacci-Folge lautet wie folgt: "
puts fibonacci_object.fibonacci(f)
gets