#Author:: Emilie Sarina Schuller, 11. Oktober 2017
#Überprüfung, ob ein String ein Palindrom ist!

puts "Hallo! Dieses Programm überprüft, ob Ihr eingegebnes Wort ein Palindrom ist!\nBitte geben Sie ein Wort Ihrer Wahl in die Konsole ein!"
eingabe = gets.chomp


if eingabe == eingabe.reverse
      then puts "Das Wort #{eingabe} ist ein Palindrom! Yay!"
    else 
      puts "Das Wort #{eingabe} ist leider kein Palindrom! Schade!"
    end
    
    puts ''
    