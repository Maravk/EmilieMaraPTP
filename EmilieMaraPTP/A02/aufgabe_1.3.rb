#Datei einlesen
#Author:: Emilie Sarina Schuller, Mara von Kroge, 11. Oktober 2017
elektrizitaet = []
  f = File.open('A02/aufgabe_1.3_text_elektrizitaet')
  
  while(elek = f.gets)
    elektrizitaet << elek
end

elektrizitaet = elektrizitaet.to_s
elektrizitaet.gsub!(/[?!,.:-]/, '')
f.close

puts "Guten Tag! Für diese Aufgabe schreiben wir die Datei 'Was ist Elektrizität?' in diese hinein und zählen Ihre Wörter sowie ermitteln die durchschnittliche Anzahl an Buchstaben in einem Wort."

total_characters = elektrizitaet.length
word_count = elektrizitaet.split.length
letters_count = elektrizitaet.scan(/[\p{L}]/).count
sentence_count = elektrizitaet.split(/\.|\?|!/).length
average_words_per_sentence = letters_count.to_f/word_count.to_f

puts''

puts "Die insgesamte Wortanzahl beträgt: " 
print word_count
puts ''
puts ''
puts "Die durchschnittliche Wortanzahl pro Satz beträgt: " 
print average_words_per_sentence
puts ''