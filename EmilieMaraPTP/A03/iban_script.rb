# Author:: Mara von Kroge, Emilie Schuller
# Skript zur IBAN-Aufgabe
# TeamChallenger

require_relative 'iban'

# Begrüßung des Nutzers sowie kurze Einführung und Erklärung des Programmes.
puts "Guten Tag! Dieses Programm wird Ihnen anhand Ihrer spezifischen Länderkennung,\nIhrer Kontonummer sowie Ihrer Bankleitzahl Ihre individuelle IBAN ermitteln!"

# Leerzeichen für die Formatierung
puts''

# Leerer String wird initialisiert.
iban = ""

# Neues Objekt der Klasse Iban wird erstellt und mit Parametern festgelegt.
# IBAN Parameter: (Länderkennung, Kontonummer, Bankleitzahl)
iban1  =  Iban.new('DE', 54874843, 34543234)
# Die IBAN wird aus den übergebenen Parametern errechnet
iban = iban1.return_iban
puts''

# Fertige IBAN wird ausgegeben.
puts "Fertige IBAN: " + iban

# Prüfung auf Korrektheit.
puts "\nDie IBAN wird mittels Prüfziffer auf Korrektheit geprüft:"
iban1.check_this_iban(iban)
