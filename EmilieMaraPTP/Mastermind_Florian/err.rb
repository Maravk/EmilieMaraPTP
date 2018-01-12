#Exceptions fuer Mastermind
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident

#Diese Exception wird geworfen, wenn ein Objekt mitgegeben wird, das von der Erwartung abweicht.
class MastermindIllegalValueError < StandardError 
end

#Diese Exception wird geworfen, wenn die Inhalte/Umstaende des Objekts es nicht zulassen, dass die Methode ausgefuehrt wird.
class MastermindIllegalContentError < StandardError 
end