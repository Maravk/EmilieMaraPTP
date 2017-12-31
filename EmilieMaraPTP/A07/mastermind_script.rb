# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 29. November 2017
# Benutzereingaben über die Konsole für das Spiel MasterMind

require_relative "mastermind.rb"

puts "Welcome to MasterMind, Buddy!"
mara=MasterMind.new
mara.generate_code
puts "Now it's your chance to divine the secret coode the computer has generated!"
puts "Just enter four of the first six numbers (1,2,3,4,5,6) into the console, seperated by a commata!"
puts "If you wanna cheat, you can choose between wether you get to see a tip by typing a t\nor if you wanna get to see the complete code, write cheat!"
puts "GL HF!"

mara.game_loop