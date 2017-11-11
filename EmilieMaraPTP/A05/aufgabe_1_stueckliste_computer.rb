# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste

require "aufgabe_1"
include Enumerable 

computerteile = []
  f=File.open('stueckliste_computer')
  while (teile = f.gets)
    compterteile << teile
  end