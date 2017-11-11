# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste

require "aufgabe_1"
include Enumerable 

obst = []
  f=File.open('stueckliste_obst')
  while (teile = f.gets)
    obst << teile
  end