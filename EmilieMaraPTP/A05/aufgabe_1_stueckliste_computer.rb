# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste


# Textdatei - Computer-Beschreibung - wird eingelesen, bis es keine weitere Zeile gibt.
computer_beschreibung = []
  f = File.open('A05/stueckliste_computer_beschreibung')
  
  while(comp = f.gets)
    computer_beschreibung << comp
  end
  
  # Textdatei - Computer-Masse - wird eingelesen, bis es keine weitere Zeile gibt.
  computer_masse = []
    f = File.open('A05/stueckliste_computer_masse')
    
    while (comp = f.gets)
      computer_masse << comp
    end
  
puts (computer_beschreibung[0] + computer_masse[0]).to_a
puts (computer_beschreibung[1] + computer_masse[1]).to_a
puts (computer_beschreibung[2] + computer_masse[2]).to_a
puts (computer_beschreibung[3] + computer_masse[3]).to_a
puts (computer_beschreibung[4] + computer_masse[4]).to_a
puts (computer_beschreibung[5] + computer_masse[5]).to_a
puts (computer_beschreibung[6] + computer_masse[6]).to_a
  
##computer = {"Prozessor" => 0.01, "Grafikkarte" => 1.3, "Gehäuse" => 7, "Kühler" => 0.7, "Netzteil" => 1.5, "Mainboard" => 1, "SSD" => 0.1}
#puts ""
#puts "Ausgabe der kompletten Stückliste Autoteile:"
#puts ''
#puts "_____________________________________________________"
#computer.each {|a, b|
#  printf("|Stück: %s  |  Masse in Kilogramm: %s|\n", sprintf("%15s", a), sprintf("%5s", b))
#}
#puts''
#puts "Das Gesamtgewicht der Stückliste beträgt #{computer.values.map.reduce(:+) } Kilogramm."
#puts''
#puts "Die Stückliste besitzt insgesamt #{computer.length} Elemente."