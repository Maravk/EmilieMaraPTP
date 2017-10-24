#Author:: Emilie Sarina schuller
#Skript zur IBAN-Aufgabe

require_relative 'iban'

iban1 = Iban.new('DE', 1234567899, 34543234)
puts iban1.to_s