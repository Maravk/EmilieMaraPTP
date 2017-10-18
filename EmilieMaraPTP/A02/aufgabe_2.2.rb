#Author:: Emilie Sarina Schuller, Mara von Kroge, 16. Oktober 2017
#Fibonacci-Folge
  #Variante 2.2

#Eine neue Methode "fibo" wurde definiert.
#Die Startwerte für die Folge werden mittels Variablen auf 0 und auf 1 gesetzt.
def fibo(n) 
  e = 0 
  f = 1
  
  #Eine Schleife mit einer n-ten Anzahl von Durchläufen wird generiert.
  n.times do 
    
    #e wird mit neuer Variable gleichgesetzt, damit sich die Zahlen immer weiter addieren.
    #Die Definition der Fibonacci-Folge: Die je aufeinanderfolgenden Zahlen werden addiert.
    c = e 
    e = f 
    f = c + e
  end
  
  return e #Die Variable e wird stets ausgegeben.
end 

puts'' #Leerzeichen für die Formatierung.


#Die Schleife soll 15-Mal ausgeführt werden.
#Das Ergebnis stellt die Fibonacci-Folge dar.
500.times do |n|
  total = fibo(n)
  
  #Das Ergebnis soll auf der Konsole ausgegeben werden.
  puts total
end
gets