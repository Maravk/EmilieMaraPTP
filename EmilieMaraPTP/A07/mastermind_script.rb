# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 29. November 2017
# Benutzereingaben über die Konsole für das Spiel MasterMind

require_relative "mastermind.rb"
puts "___  ___             _                           _             _" 
puts "|  \\/  |            | |                         (_)           | |"
puts "| .  . |  __ _  ___ | |_   ___  _ __  _ __ ___   _  _ __    __| |"
puts "| |\\/| | / _` |/ __|| __| / _ \\| '__|| '_ ` _ \\ | || '_ \\  / _` |"
puts "| |  | || (_| |\\__ \\| |_ |  __/| |   | | | | | || || | | || (_| |"
puts "\\_|  |_/ \\__,_||___/ \\__| \\___||_|   |_| |_| |_||_||_| |_| \\__,_|"
puts "_________________________________________________________________\n\n"
puts "Welcome to MasterMind, Buddy!"
puts "Now it's your chance to solve the secret code the computer has generated!"
puts "The code consists of four numbers out of 6 with duplicates"
puts "Type your guess into the console, seperated by a commata!"
puts "If you wanna cheat, you can choose whether you get to see a tip by typing a \"t\","
puts "or if you wanna get to see the complete code, write \"cheat\"!"
puts "Good Luck and have fun!"

mastermind=Mastermind.new
mastermind.generate_code
mastermind.game_loop