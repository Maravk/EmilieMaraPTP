#Datei einlesen
#Author:: Emilie Sarina Schuller, Mara von Kroge, 11. Oktober 2017

#Leeres Array 'elektrizitaet' wird erstellt und das File unter dem gespeicherten Namen 'aufgabe_1.3_text_elektrizitaet' wird eöffnet
elektrizitaet = []
  f = File.open('A02/aufgabe_1.3_text_elektrizitaet')
  
#Solange das File keine neue Zeile anzeigt, wird das File in das Array eingelesen  
  while(elek = f.gets)
    elektrizitaet << elek
end

#Aus dem Array werden Zeilenumbrüche entfernt und das Array wird in einen String umgewandelt
elektrizitaet.delete("\n")
elektrizitaet = elektrizitaet.to_s
elektrizitaet.gsub!(/['?!,.:\-""]/, '')
f.close

puts "Guten Tag! Für diese Aufgabe importieren wir die Datei 'Was ist Elektrizität?' \nund zählen Ihre Wörter und ermitteln die durchschnittliche Anzahl an Buchstaben in einem Wort."

#Mithilfer folgender Methoden wird die insgesamte Wortanzahl bestimmt, die Buchstaben gezählt und am Ende diese beiden Werte durcheinander geteilt, damit man auf den Buchstabendurchschnitt im Wort kommt.
#total_characters = elektrizitaet.length
word_count = elektrizitaet.split.length
letters_count = elektrizitaet.scan(/[\p{L}]/).count
#sentence_count = elektrizitaet.split(/\.|\?|!/).length
average_words_per_sentence = letters_count.to_f/word_count.to_f

puts''

#Ausgabe der Wortanzahl sowie der durchschnittlichen Buchstabenanzahl pro Wort
puts "Die insgesamte Wortanzahl in dem Gedicht von Robert Gerhard beträgt: " 
puts word_count
puts ''
puts ''
puts "Die durchschnittliche Wortanzahl in dem Gedicht von Robert Gerhard pro Satz beträgt: " 
puts average_words_per_sentence
puts ''