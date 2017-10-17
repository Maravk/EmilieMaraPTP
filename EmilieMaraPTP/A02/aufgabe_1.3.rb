#Datei importieren
#Author:: Emilie Sarina Schuller, Mara von Kroge, 11. Oktober 2017

#Leeres Array 'elektrizitaet' wird erstellt und das File unter dem gespeicherten Namen 'aufgabe_1.3_text_elektrizitaet' wird geöffnet.
elektrizitaet = []
  f = File.open('A02/aufgabe_1.3_text_elektrizitaet')
  
#Solange das File keine neue Zeile aufweist, wird das File in das Array eingelesen.
  while(elek = f.gets)
    elektrizitaet << elek
end

#Aus dem Array werden Zeilenumbrüche sowie Sonderzeichen entfernt und das Array wird in einen String umgewandelt.
elektrizitaet.delete("\n")
elektrizitaet = elektrizitaet.to_s
elektrizitaet.gsub!(/['?!,.:\-""]/, '')
f.close

puts "Guten Tag! Für diese Aufgabe importieren wir die Datei 'Was ist Elektrizität?', zählen\nihre Wörter und ermitteln die durchschnittliche Anzahl an Buchstaben in einem Wort."

#Mithilfe folgender Methoden wird die insgesamte Wortanzahl bestimmt, werden die Buchstaben gezählt und am Ende diese beiden Werte durcheinander geteilt, damit man auf den Buchstabendurchschnitt in einem Wort kommt.
word_count = elektrizitaet.split.length
letters_count = elektrizitaet.scan(/[\p{L}]/).count
average_letters_per_word = letters_count.to_f/word_count.to_f

puts''

#Ausgabe der Wortanzahl sowie der durchschnittlichen Buchstabenanzahl pro Wort.
#Mittels "puts ''" werden stets neue Leerzeilen erzeugt.
puts "Die insgesamte Wortanzahl in dem Gedicht von Robert Gerhard beträgt: " 
puts word_count
puts ''
puts "Die durchschnittliche Buchstabenanzahl pro Wort in dem Gedicht von Robert Gerhard beträgt: " 
puts average_letters_per_word


#Folgende Quelle haben wir für diese Aufgabe benutzt: https://leanonthefly.wordpress.com/2014/08/06/how-to-create-a-text-analyzer-in-ruby/