# Author: Mara von Kroge, Emilie Schuller, 21.11.2017
# TeamChallenger
# Script zur Part Klasse

require_relative "part"
include Enumerable


my_list = Part.new("CPU", 0.01, "Computer")


my_list.add_part("GPU", 0.02)
my_list.add_part("Mainboard", 1)

