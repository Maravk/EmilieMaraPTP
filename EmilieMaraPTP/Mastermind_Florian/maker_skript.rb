#Skript fuer MastermindMaker
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident

require_relative "mastermind_maker.rb"
@colors = ["rot", "gelb", "gruen", "blau", "orange", "lila"]

#Gibt die Hinweise fuer den Spieler aus. Benoetigt keine mitzugebenden Parameter.
def text_begin()
  printf("%s\n\n%42s%-16s\n\n%s\n\n", "#"*100,"","MASTERMIND MAKER","#"*100)
  printf("%-100s\n\n","Herzlich Willkommen bei MASTERMIND MAKER! Hier ist der Rechner der Maker und Du bist der Breaker.")
  printf("%-100s\n","Der Rechner generiert aus den 6 verschiedenen Farben (Rot, Gelb, Gruen, Blau, Orange, Lila) einen")
  printf("%-100s\n","vierstelligen Code. Du hast 10 Versuche, um ihn zu erraten. Wenn die Stelle richtig ist, landest Du")
  printf("%-100s\n","einen schwarzen Treffer. Wenn die Position deines Tipps nicht stimmt, die gleiche Farbe aber an")
  printf("%-100s\n","einer anderen Position ist, die kein schwarzer Treffer ist und noch nicht beruecksichtigt wurde,")
  printf("%-100s\n\n","landest Du einen weissen Treffer. Moechtest du einen Tipp, schreibe einfach \"t\". Los geht´s!")
  printf("%-100s\n","Zur Erinnerung: Zur Auswahl stehen:")
  printf("%-100s\n\n","Rot, Gelb, Gruen, Blau, Orange, Lila")
  printf("%-100s\n\n", "#"*100)

end

@game = MastermindMaker.new(6,4)

#Liest die Wahl des Menschen ein, so lange, bis sie stimmt. Gibt einen Array mit den Farbenzahlen zurueck.
def read_choice(n)
  printf("%d. Runde: (Bitte Farben nur durch Leerzeichen trennen!)\n", n)
  rightinput = false
  while !rightinput
    input = gets.strip().downcase().split()
    res_ary = []
    input.each{|m| res_ary << col_to_i(m)} if input.length() == 4 && !(input.any?{|n| !(n.is_a?(String))})
    if input[0] == "t"
      tipp()
    elsif !@game.request_valid?(res_ary)
      puts "Falsche Eingabe! Bitte ueberpruefe und wiederhole sie jetzt!\n\n"
    else
      rightinput = true
    end
  end
  return res_ary
end

#Sucht zu einem String, der mitgegeben werden muss, die Farbennummer heraus. Wenn sie nicht gefunden wird, dann wird 0 zurueckgegeben.
def col_to_i(string)
  ret= @colors.index(string)
  if ret.nil?
    ret = 0
  else
    ret+=1
  end
end

#Ausgabe des Tipps. Benoetigt keine  mitzugebenden Parameter.
def tipp()
  puts("Dein Tipp: Eine enthaltene Farbe ist #{@colors[@game.hint() -1]}.")
end

#Gibt die eingelesenen, mitzugebenden Werte (Array) an die MastermindMaker-Klasse weiter, um eine Bewertung zu erhalten. Gibt die Ergebnisse in der Konsole aus.
def evaluation(array)
  result = @game.request(array)
  printf("Du hast %d schwarze%s und %d weisse%s Treffer gelandet.\n\n%s\n\n", result[0], result[0]==1 ? "n" : "",result[1], result[1]==1 ? "n" : "", "#"*100 )
end

text_begin()
while !(@game.end?())
  ary = read_choice(@game.round())
  evaluation(ary)
end
solution = @game.solution()
puts("Ende: Du hast #{@game.won?() ? "gewonnen, denn die richtige Loesung ist " : "verloren. Die Loesung ist "}#{@colors[solution[0]-1]+" "+@colors[solution[1]-1]+" "+@colors[solution[2]-1]+" "+@colors[solution[3]-1]}!")