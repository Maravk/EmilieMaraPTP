#Author:: Emilie Sarina Schuller, Mara von Kroge, 18.Oktober 2017
#IBAN

class Iban
  def initalize (laenderkennung,bankleitzahl,kontonummer)
  @laenderkennung = laenderkennung
  @bankleitzahl = bankleitzahl
  @kontonummer = kontonummer


iban1 = Iban1.new
iban2 = Iban2.new
iban3 = Iban3.new
iban4 = Iban4.new


def berechnung
  
  puts "Guten Tag! Dieses Programm berechnet für Sie ihre IBAN! Hierfür benötigt das Programm Ihr jeweiliges \nLand, Ihre Bankleitzahl sowie Ihre gültige Kontonummer, um aus diesen Werten die Prüfziffer zu berechnen!"
puts "Bitte geben Sie hier Ihre Kontonummer ein: "
eingabe = gets.chomp
eingabe = k
k.to_s

puts "Bitte geben Sie hier Ihre Bankleitzahl ein: "
eingabe = gets.chono
eingabe = b
b.to_s

pruefziffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  
puts "Ihre IBAN lautet wie folgt: #{k} #{b}"

end
  end 
end 

