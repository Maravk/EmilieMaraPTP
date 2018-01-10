# Author:: Emilie Schuller
# Author:: Mara von Kroge
# 10.Januar 2018
# Mastermind - IO

class MasterMindIO
  
  def start
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
  end
  
  
  def input_human_codemaker
    @input = gets.chomp.split(" ")
    check_combination_human_codemaker
  end
  
  def new_game
    puts "\n\n-----New Game-----"
    # methoden wieder durchgehen
  end
  
  
  def cheat
    if @input == ["tipp"]
      puts "You can find the color #{@codes.sample} in the code."
    end
    
    if @input == ["cheat"]
      puts "Solution: " +@code.to_s
    end
    
    if @input == ["new"]
    new_game
    end
    
    if @input == ["exit"]
      exit
    end
  end
  
  
  def check_combination_human_codemaker
    @input.each {|number|
      if !@elements.to_s().include?(number)
        puts "Error, please enter a valid number!"
      end
    }
  end
  
  
  def table
    puts "Round: " + (@round+1).to_s
    puts "|  Your Codes  | Black | White |"
    i = 0
    while(i < @round + 1) do
      protocol_string = ""
      
      # Jede neue Runde wird als eine Art Tabelle auf die Konsole ausgegeben.
      protocol[i].each_index { |index|
        protocol_string << protocol[i][index].to_s << "  "
      }
      puts "|  " + protocol_string.to_s + "|   "\
      + black_hits[i].to_s + "   |   " + white_hits[i].to_s + "   |"
      i+=1
    end
    end 
    
  def won
    if @black_hits == 4
      puts "The Code has been solved!"
    end
  end 
  
  
  def lost
    if @rounds_left == 0
      puts "10 out of 10 rounds! You lost!"
      puts "The code was: #{code.to_s}!"
      exit
    end
  end
  
end