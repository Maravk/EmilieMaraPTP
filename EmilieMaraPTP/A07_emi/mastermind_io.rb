# Author:: Emilie Schuller
# Author:: Mara von Kroge
# 10.Januar 2018
# Mastermind - IO

require_relative 'mastermind.rb'

class MastermindIO
  
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
#    puts "Type your guess into the console, seperated by a commata!"
#    puts "If you wanna cheat, you can choose whether you get to see a tip by typing a \"t\","
#    puts "or if you wanna get to see the complete code, write \"cheat\"!"
#    puts "Good Luck and have fun!"
    while(true) do
      puts "Do you want to solve a code(1), or let your code be solved by the Computer?(2)"
      who_solves = gets.chomp
      if who_solves == "1"
        puts "You are the codesolver!"
        break
      elsif who_solves == "2"
        puts "The Computer is going to solve the code"
        break
      else
        puts "Error. Please type \"1\" or \"2\" for your choice."
      end
    end
    setup(who_solves)
  end
  
  def setup(who_solves)
    if (who_solves == "1") #Player solves code
      puts "Play with normal rules(1) or change rules?(2)"
      while(true) do
        rules = gets.chomp
        if rules == "1"
          puts "We will play with normal rules(4 fields, 6 numbers, 10 rounds)"
          start_game(who_solves, 4, 6)
        elsif rules == "2"
          puts "Ok, we will let you change the rules"
          break
        else
          "Error. Please type \"1\" or \"2\" for your choice."
        end
      end
      if (rules == "2")
        while(true) do
          puts "Length of code?(standard is 4)"
          length_of_code = gets.chomp
          if ((1..10).include?(length_of_code.to_i))
            puts "Length of code:" + length_of_code.to_s
            break
          else
            puts "Error: Please choose a length from 1 to 10"
          end
        end
        while(true) do
          puts "How many numbers?(standard is 6)"
          amount_of_numbers = gets.chomp
          if ((1..10).include?(amount_of_numbers.to_i))
            puts "Amount of numbers: #{amount_of_numbers}"
            break
          else
            puts "Error: Please choose a length from 1 to 10"
          end
        end
        while(true) do
          puts "How many rounds?(Standard is 10)"
          amount_of_rounds = gets.chomp
          if ((1..100).include?(amount_of_rounds.to_i))
            puts "Amount of rounds: #{amount_of_rounds}"
            break
          else
            puts "Error: Please choose a length from 1 to 100"
          end
        end
        
        player_solves(length_of_code, amount_of_numbers, amount_of_rounds)
        
      end
      if (rules == 1)
        player_solves( 4, 6, 10)
      end
    end
    if (who_solves == "2") #Computer
      computer_solves
    end
  end
  
  def player_solves(length_of_code, amount_of_numbers, amount_of_rounds)
    puts "player solves"
    puts "length_of_code: #{length_of_code}"
    puts "amount_of_numbers: #{amount_of_numbers}"
    puts "amount_of_rounds: #{amount_of_rounds}"
    # initialize(code_length, elements, rounds)
    mm = Mastermind.new(length_of_code.to_i, amount_of_numbers.to_i, amount_of_rounds.to_i)
    mm.generate_code
    mm.game_loop
  end
  
  def computer_solves()
    puts "Computer solves"
  end
  
  def new_game
    puts "\n\n-----New Game-----"
    # methoden wieder durchgehen
  end
  
  def print_new_game
    puts "\n\n-----NEW-GAME-----"
  end
  
  def input_code(code)
    a = 1
    while(a==1) do
      # Eingabe des Menschen
      puts "Your Code:"
      @input = []
      @input = gets.chomp.split(" ")
      
      # Tipp/Cheat für den User
      if @input == ["tipp"]
        puts "For real...?"
        puts "You can find the color #{code.sample} in the code."
      elsif @input == ["cheat"]
        puts "Weakness disgusts me...!"
        puts "Solution: " + code.to_s
        
      # Neues Game
      elsif @input == ["new"]
        new_game  
        
      # Aufhören  
      elsif @input == ["exit"]
        exit
      else
        
        # Überprüfung der Eingabe
        @input.each { |input|
          if !@elements.to_s.include?(input)
            puts "Error! Please put numbers (1,2,3,4,5,6)."
            a=1
            break
          else
            a=0
          end
        }
      end
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
  
  def result
    hits = compare_codes  
  end
  
  # initialize(code_length, elements, rounds)
  #mm = Mastermind.new(4, 6, 10)    
end

mmio = MastermindIO.new
mmio.start