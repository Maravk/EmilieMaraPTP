##Author:: Emilie Sarina Schuller, 11. Oktober 2017
##Etwas von der Konsole einlesen und als String speichern

puts "Guten Tag! Bitte geben Sie Ihren Namen ein!"
eingabe = gets.chomp
puts "Ich freue mich, Sie hier anzutreffen, " + eingabe + ", Ihr Name ist sehr schön!"
puts ''
puts "Geht es Ihnen heute gut? Sofern sie glücklich sind, drücken sie die (1), und sofern heute nicht Ihr Tag ist, die (0)."
eingabe = gets.chomp
if eingabe != 0
  then puts "Das klingt doch gut! Genießen Sie Ihren weiteren Tag!"
else
  puts "Dann hoffe Ich, dass es Ihnen im Laufe des Tages besser gehen wird!!"
end 

puts "Wie lautet denn Ihre Lieblingsfarbe?"
eingabe = gets.chomp
puts "Oh, interessant! Meine Lieblingsfarbe ist pink!"
puts ''

puts "Eine letzte Frage zum Abschluss noch: Wie alt (oder eher jung) sind Sie?"
einabe = gets.chomp
puts ''
puts "Alles klar! Ich danke Ihnen herzlichst für diese kleine Auskunft!"