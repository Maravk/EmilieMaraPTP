#Author:: Emilie Sarina Schuller, Mara von Kroge 11. Oktober 2017
#Etwas von der Konsole einlesen und als String speichern

#Mit puts wird auf der Konsole immer der jeweilige Ausdrucke ausgegeben.
#Durch "eingabe = gets.chomp" kann der Nutzer etwas eingeben und der Zeilenumbruch wird verhindert.
#Durch jedes "eingabe.to_s" wird der vom Nutzer eingegebene Text als String gespeichert.

puts "Guten Tag! Bitte geben Sie Ihren Namen ein!"
eingabe = gets.chomp
eingabe.to_s

puts''

puts "Ich freue mich, Sie hier anzutreffen, " + eingabe + ", Ihr Name ist sehr schön!"
puts "Geht es Ihnen heute gut? Sofern sie glücklich sind, drücken sie die (1), und sofern heute nicht Ihr Tag ist, die (0)."
eingabe = gets.chomp
eingabe.to_s

#if-Schleife --> Je nach Eingabe des Nutzers wird auf der Konsole etwas Anderes ausgegeben.
if eingabe == "0"
  puts "Dann hoffe Ich, dass es Ihnen im Laufe des Tages besser gehen wird!!"
else
  puts "Das klingt doch gut! Genießen Sie Ihren weiteren Tag!"

end 


puts "Wie lautet denn Ihre Lieblingsfarbe?"
eingabe = gets.chomp
eingabe.to_s

puts "Oh, interessant! Meine Lieblingsfarbe ist pink! Eine letzte Frage zum Abschluss noch: Wie alt (oder eher jung) sind Sie?"
eingabe = gets.chomp
eingabe.to_s

puts ''
puts "Alles klar! Ich danke Ihnen herzlichst für diese kleine Auskunft!"
gets