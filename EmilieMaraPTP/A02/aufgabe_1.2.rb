#Author:: Emilie Sarina Schuller, Mara von Kroge, 11. Oktober 2017
#Überprüfung, ob ein String ein Palindrom ist!

puts "Hallo! Dieses Programm überprüft, ob Ihr eingegebenes Wort ein Palindrom ist!\nBitte geben Sie ein Wort Ihrer Wahl in die Konsole ein!"
eingabe = gets.chomp

#Sofern der User nur ein Leerzeichen eingibt, fordert das Programm den Nutzer dazu auf, ein Wort einzugeben.
if eingabe == " "
  then puts "Bitte geben Sie ein Wort ein!" 
end

#Leerzeichen
puts''

#Mittels der Methode ".downcase" werden alle Großbuchstaben im eingegebenen String in Kleinbuchstaben umgewandelt.
eingabe = eingabe.downcase

#Sofern das Wort von links nach rechts gelesen dem gleichen Wort wie von rechts nach links entspricht, ist das Wort ein Palindrom.
if eingabe == eingabe.reverse
      then puts "Das Wort '#{eingabe}' ist ein Palindrom! Yay!"
    else 
      puts "Das Wort '#{eingabe}' ist leider kein Palindrom! Schade!"
    end
    
    puts ''
