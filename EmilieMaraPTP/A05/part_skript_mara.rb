# Author: Emilie Schuller, Mara von Kroge
# TeamChallenger
# 21.11.2017
# Part Skript

require_relative 'part'

auto = Part.new("Auto", 0, nil)

auto.add_part("Reifen", 45)
auto.add_part("Motor", 850)
puts auto.size_parts()
puts auto.total_weight()

auto.add_part("Sitze", 20)
puts ''
auto.write_to_file()

auto.load_from_file("A05/Auto")
puts auto.name()
puts ''
puts auto.total_weight()