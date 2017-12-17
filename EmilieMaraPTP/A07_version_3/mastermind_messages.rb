# Author:: Emilie Schuller
# 17. Dezember 2017
# Mastermind - Messages

require_relative "mastermind_start.rb"

# Klasse für alle Nachrichten auf die Konsole
class MasterMindMessages
  
  
  def ungueltige_eingabe_message
    "Sorry, bitte gib eine 1 oder eine 2 ein."
  end
  
  def mensch_codebreaker_message
    "Du hast dich entschieden, den Code des Computers knacken zu wollen."
  end
  
  def mensch_codemaker_message
    "Du hast dich entschieden, einen eigenen Code zu generieren, welchen der Computer erraten soll."
  end
  
  def computer_kombination_erraten_message
    "Der Computer beginnt nun und versucht, deinen Code zu knacken!"
  end
  
  def spieler_gewinnt_message
    "Yeah! Der Computer hat es nicht hinbekommen, deinen Code zu erraten!"
  end
  
  def computer_gewinnt_message
    "Der Computer hat deinen Code erraten!"
  end
end