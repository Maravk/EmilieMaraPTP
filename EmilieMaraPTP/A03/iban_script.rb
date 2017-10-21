#Author:: Emilie Sarina schuller
#Skript zur IBAN-Aufgabe

require_relative 'iban'

iban1 = Iban.new('DE', 6789054326, 22446688)
puts iban1.to_s