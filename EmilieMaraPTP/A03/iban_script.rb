#Author:: Emilie Sarina schuller
#Skript zur IBAN-Aufgabe

require_relative 'iban'

iban1 = Iban.new('DE', 1311405706, 20050550)
puts iban1.to_s