#Skript fuer MastermindBreaker
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident

require_relative "mastermind_breaker.rb"
@colors = ["Rot", "Gelb", "Gruen", "Blau", "Orange", "Lila"]

  #Gibt die Hinweise fuer den Spieler aus. Benoetigt keine mitzugebenden Parameter. 
def text_begin()
  printf("%s\n\n%42s%-16s\n\n%s\n\n", "#"*100,"","MASTERMIND BREAKER","#"*100)
  printf("%-100s\n\n","Herzlich Willkommen bei MASTERMIND MAKER! Hier ist der Rechner der BREAKER und Du bist der MAKER.")
  printf("%-100s\n","Du generierst aus den 6 verschiedenen Farben (Rot, Gelb, Gruen, Blau, Orange, Lila) einen")
  printf("%-100s\n","vierstelligen Code. Der Rechner hat 10 Versuche, um ihn zu erraten. Wenn die Stelle richtig ist, landet er")
  printf("%-100s\n","einen schwarzen Treffer. Wenn die Position seines Tipps nicht stimmt, die gleiche Farbe aber an")
  printf("%-100s\n","einer anderen Position ist, die kein schwarzer Treffer ist und noch nicht beruecksichtigt wurde,")
  printf("%-100s\n","landet er einen weissen Treffer. Du sagst dem Rechner, wie viele schwarze und weisse Treffer er")
  printf("%-100s\n\n","gemacht hat. Los geht´s!")
  printf("%-100s\n","Zur Erinnerung: Zur Auswahl stehen:")
  printf("%-100s\n\n","Rot, Gelb, Gruen, Blau, Orange, Lila")
  printf("%-100s\n\n", "#"*100)

end

@game = MastermindBreaker.new(6,4)

#Gibt die Anzahl der Runde aus (muss mitgegeben werden) und stellt den Vorschlag des Computers dar.
def computer_suggestion(n)
  sug = @game.get_suggestion()
  str = ""
  sug.each{|k| str += (" "+ i_to_col(k)) }
  printf("%-100s\n\n", "#"*100)
  printf("%2d. Runde:\nDer Vorschlag des Rechners lautet:%s\n\n",n, str)
end

#Liest die Antwort des Menschen ein, so lange, bis sie stimmt.
def read_answer()
  printf("Was hat der Rechner richtig?: Anzahl schwarze Treffer LEERZEICHEN Anzahl weisse Treffer\n")
  rightinput = false
  while !rightinput
    input = gets.strip().split()
    res_ary = []
    input.each{|m| res_ary << m.to_i } if input.length() == 2 && !(input.any?{|n| !(n.is_a?(String))}) && !input.any?{|k| !("0".."9").any?{|p| k.include?(p)} }
    if !@game.answer_valid?(res_ary) ##HIER WEITERMACHEN
      puts "Falsche Eingabe! Bitte ueberpruefe und wiederhole sie jetzt!\n\n"
    else
      rightinput = true
    end
  end
  return res_ary
end

#Sucht zu einer Farbennummer den String heraus. Wenn das Argument kein Integer ist, wird ein ArgumentError geworfen.
def i_to_col(int)
  ret= @colors[int -1].clone
end

text_begin()
cheat = false
while !(@game.end?()) && !cheat
  begin
    computer_suggestion(@game.round())
    answ = read_answer()
    @game.declare_answer(answ)
  rescue MastermindIllegalContentError => mice
    puts "Du schummelst oder hast dich beim Auswerten vertan! --> ENDE..."
    cheat = true
  end
end
if @game.end?()
solution = @game.solution()
str = ""
solution.each{|k| str += (" "+ i_to_col(k)) }
printf("%-100s\n\n", "#"*100)
puts("Ende: Du hast #{!@game.won?()  ? "gewonnen, denn die richtige Loesung ist " : "verloren. Die Loesung ist"}#{str}!") 
end