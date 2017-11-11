# Author: Emilie Schuller, Mara von Kroge, 11. November 2017
# TeamChallenger
# Stückliste

require "aufgabe_1"
include Enumerable 

autoteile = []
  f=File.open('stueckliste_auto')
  while (teile = f.gets)
    autoteile << teile
  end