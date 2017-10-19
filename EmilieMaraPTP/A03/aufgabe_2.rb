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
k.to_chars

if k > 10
  puts "Bitte geben Sie eine 10-stellige Kontonummer ein!"


puts "Bitte geben Sie hier Ihre Bankleitzahl ein: "
eingabe = gets.chono
eingabe = b
b.to_chars

if b > 8
  puts "Bitte geben sie eine 8-stellige Bankleitzahl ein!"

pruefziffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  
puts "Ihre IBAN lautet wie folgt: #{k} #{b}"

  pruefziffer[0] = k[0]
  pruefziffer[1] = k[1]
  pruefziffer[2] = k[2]
  pruefziffer[3] = k[3]
  pruefziffer[4] = k[4]
  pruefziffer[5] = k[5]
  pruefziffer[6] = k[6]
  pruefziffer[7] = k[7]
  pruefziffer[8] = k[8]
  pruefziffer[9] = k[9]
  pruefziffer[10] = k[0]
  pruefziffer[11] = b[1]
  pruefziffer[12] = b[2]
  pruefziffer[13] = b[3]
  pruefziffer[14] = b[4]
  pruefziffer[15] = b[5]
  pruefziffer[16] = b[6]
  pruefziffer[17] = b[7]
  
  
  puts pruefziffer[0..17] + "1314 00"
  
  
block 1 = pruefziffer[0..9]
division = (block 1/97).to_i



end 
  end 
end 

