#Datei einlesen
#Author:: Emilie Sarina Schuller, Mara von Kroge, 11. Oktober 2017

elektrizitaet = []
  f = File.open('A02/aufgabe_1.3_text_elektrizitaet')
  
  while(elek = f.gets)
    elektrizitaet << elek
end


elektrizitaet.delete("\n")
elektrizitaet = elektrizitaet.to_s
elektrizitaet.gsub!(/['?!,.:-]/, '')
f.close

puts "Guten Tag! Für diese Aufgabe importieren wir die Datei 'Was ist Elektrizität?' \nund zählen Ihre Wörter und ermitteln die durchschnittliche Anzahl an Buchstaben in einem Wort."

total_characters = elektrizitaet.length
word_count = elektrizitaet.split.length
letters_count = elektrizitaet.scan(/[\p{L}]/).count
sentence_count = elektrizitaet.split(/\.|\?|!/).length
average_words_per_sentence = letters_count.to_f/word_count.to_f

puts''

puts "Die insgesamte Wortanzahl in dem Gedicht von Robert Gerhard beträgt: " 
puts word_count
puts ''
puts ''
puts "Die durchschnittliche Wortanzahl in dem Gedicht von Robert Gerhard pro Satz beträgt: " 
puts average_words_per_sentence
puts ''