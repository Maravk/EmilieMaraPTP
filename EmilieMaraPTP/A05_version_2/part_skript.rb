# Author: Emilie Schuller, Mara von Kroge, 24. November 2017
# TeamChallenger
# Skript zur Klasse Part

require_relative 'part.rb'
require_relative 'part_to_file'

auto = Part.new("Auto", 1380)

auto_reifen = Part.new("Reifen", 120, auto)
puts auto_reifen.parent.name
auto.add_part(auto_reifen)
puts auto.parts_amount
puts auto.parts_and_mass

auto_bremse = Part.new("Bremsen", 40, auto)
auto.add_part(auto_bremse)
puts auto.parts_amount
puts auto.parts_and_mass

auto_motor = Part.new("Motor", 480)
auto.add_part(auto_motor)
puts auto.parts_amount
puts auto.parts_and_mass

auto_zylinder = Part.new("Zylinder", 18, auto_motor)
auto_motor.add_part(auto_zylinder)
puts auto.parts_amount
puts auto.parts_and_mass

puts auto_motor.parts_and_mass

puts auto.part_table

some_file = PartToFile.new()
#some_file.write_to_file(auto, "auto")

puts "Zylinder ist Einzelteil vom Ganzen: " + auto_zylinder.top.name
puts "Masse des ganzen Autos in Kilogramm: " + auto.mass_of_all.to_s
puts "Das Auto besteht aus insgesamt #{auto.total_parts_amount.to_s} Einzelteilen."
puts "Bremse wird entfernt."
auto.remove(auto_bremse)
puts "Auto besteht nun aus insgesamt #{auto.total_parts_amount.to_s} Einzelteilen."
puts''
puts "Darstellung der Stückliste Auto als Tabelle:"
puts ''
puts auto.part_table

puts "Masse des ganzen Autos in Kilogramm: " + auto.mass_of_all.to_s

puts "test"
puts auto.name


