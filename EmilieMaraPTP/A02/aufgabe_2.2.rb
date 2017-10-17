#Author: Emilie Sarina Schuller, Mara von Kroge
#Fibonacci-Folge
  #Variante 2.2


#Author: Emilie Sarina Schuller, Mara von Kroge, 16. Oktober 2017
#Fibonacci-Folge
  #Variante 2.2

def fibo(n) #Neue Methode "fibo" wurde definiert
e = 0 #Die Startwerte für die Folge werden mittels Variablen auf 0 und auf 1 gesetzt
f = 1

n.times do #Eine Schleife mit einer n-ten Anzahl von Durchläufen wird generiert
  c = e #e wird mit neuer Variable gleichgesetzt, damit sich die Zahlen immer weiter addieren
  e = f #Definition der Fibonacci-Folge: Die je aufeinanderfolgenden Zahlen werden addiert
  f = c + e
end

return e #e wird stets ausgegeben
end 

puts'' #Leerzeichen für die Formatierung

10.times do |n| #Die Schleife soll 10-Mal ausgeführt werden
  total = fibo(n) #Das Ergebnis stellt die Fibonacci-Folge dar
  puts total #Das Ergebnis soll auf der Konsole ausgegeben werden
end


