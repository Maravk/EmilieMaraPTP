# Startbildschirm von Mastermind
# Author:: Emilie Schuller, Dominik Tobaben, Ralf Herrmann
# Team:: Team.new(ALT-F4)

puts "##################################################################"
puts "#             Herzlich Willkommen zu Mastermind!                 #"
puts "################################################################## \n\n\n"
puts "##################################################################"
puts "#              Bitte wählen Sie ihren Spielmodus aus             #"
puts "#  - Geben Sie bitte 'CM' ein um gegen den Computer zu spielen   #"
puts "#  - Geben Sie bitte 'CB' ein um gegen den Computer zu spielen   #"
puts "#----------------------------------------------------------------#"
puts "#  - Geben Sie VS ein um gegen eine Person zu spielen            #"
puts "#----------------------------------------------------------------#"
puts "#     Wenn Sie sich mit den Regeln vertraut machen wollen,       #"
puts "#                   geben Sie 'Hilfe' ein                        #"
puts "##################################################################"

p = gets.chomp.to_s.upcase

if p == "CM"
  puts "Sie haben sich für den Codemaker entschieden"
  puts "Bitte geben Sie einen Code ein, den der Computer knacken soll"
  
elsif p == "CB"
  puts "Sie haben sich für den Codebreaker entschieden"
  puts "Sie müssen nun den Code vom Computer knacken. \n Falls Sie einen Tipp haben wolln, dann geben Sie Tipp ein."
  
elsif p == "VS"
  puts "Sie haben sich dafür entschieden gegen den Computer zu spielen"
  
  
else p == "HILFE"
puts "##################################################################"
puts "#                    Regelwerk zu Mastermind!                    #"
puts "################################################################## \n\n\n"  
puts "##################################################################"
puts "#      1. Es gibt immer eine Kombination aus 4^6 Farben          #"
puts "#----------------------------------------------------------------#"
puts "#                   geben Sie 'Hilfe' ein                        #"
puts "##################################################################"
end