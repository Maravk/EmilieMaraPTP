## Author:: Emilie Schuller
## 17. Dezember 2017
## Mastermind - Game geht los
##
#require_relative "mastermind_messages.rb"
#
#
#puts "Good Day, Mate! Welcome to MasterMind! In this Game, you can challenge your skills concerning policy as well as rating."
#puts "You can choose wether you want to generate a secret code and let the computer do the work or you jump into the position"
#puts "of the Codebreaker and try to crack the computer's combination! Hope you'll have some fun!"
#
#puts "\nL37 73h 94M35 8391N.\n"
#
#puts "It's time to choose!"
#puts "[ 1 ] for being the Codebreaker."
#puts "[ 2 ] for being the Codemaker."
#
#mensch_codebreaker = nil
#mensch_codemaker = nil
#
#
## Spielmodus wird gewählt
#eingabe = gets.chomp.to_i
#
## Überprüfung des richtigen Typs
#if !eingabe.instance_of?(Integer)
#  raise TypeError do self.ungueltige_eingabe_message
#  end
# end
# 
# # Überprüfung der richtigen Zahl
# if eingabe != (1 || 2)
#   raise TypeError do self.ungueltige_eingabe_message
#   end
# end
#
# # Spielmodus 
# case eingabe  
#   # Mensch errät den Code.
# when 1
#   mensch_codebreaker = MasterMind.new
#   mensch_codebreaker.mensch_codebreaker_message
#   mensch_codebreaker.kombination_computer
#   mensch_codebreaker.ermittle_kombination_computer
#   
#   # Mensch konzipiert den Code.
# when 2
#   mensch_codemaker = MasterMind_ai.new
#   mensch_codemaker.mensch_codemaker_message
# end
# 
# 