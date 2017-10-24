# Author:: Emilie Sarina Schuller
# Skript zur IBAN-Aufgabe
# TeamChallenger

require_relative 'iban_mara'

# Begrüßung des Nutzers sowie kurze Einführung und Erklärung des Programmes.
puts "Guten Tag! Dieses Programm wird Ihnen anhand Ihrer spezifischen Länderkennung,\nIhrer Kontonummer sowie Ihrer Bankleitzahl Ihre individuelle IBAN ermitteln!"

# Leerzeichen für die Formatierung
puts''

iban = ""
iban1 = Iban.new('DE', 54874843, 34543234)
iban = iban1.return_iban
puts''
puts "Fertige IBAN: " + iban
iban1.check_this_iban(iban)
<<<<<<< HEAD

#puts "Fertige IBAN: " + iban
=======
puts "Fertige IBAN: " + iban
>>>>>>> branch 'master' of https://github.com/Maravk/EmilieMaraPTP.git
