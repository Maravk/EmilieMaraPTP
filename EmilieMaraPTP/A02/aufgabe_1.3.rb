#Datei einlesen
#Author:: Emilie Sarina Schuller, Mara von Kroge, 11. Oktober 2017

elektrizität = []
  f = File.open("aufgabe_1.3_text_elektrizität")
  
  while(elek = f.gets)
    elektrizität << elek
end

elektrizität = elektrizität.to_s
elektrizität.gsub!(/[?!,.:-]/, '')
f.close

puts "Guten Tag! Für diese Aufgabe schreiben wir die Datei 'Was ist Elektrizität?' in diese hinein und zählen Ihre Wörter sowie ermitteln die durchschnittliche Anzahl an Buchstaben in einem Wort."

total_characters = elektrizität.length
word_count = elektrizität.split.length
sentence_count = elektrizität.split(/\.|\?|!/).length
average_words_per_sentence = total_characters/word_count

puts''

puts "Die insgesamte Wortanzahl beträgt: " 
print word_count
puts ''
puts ''
puts "Die durchschnittliche Wortanzahl pro Satz beträgt: " 
print average_words_per_sentence
puts ''