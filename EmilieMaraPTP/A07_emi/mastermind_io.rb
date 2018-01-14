# Author:: Emilie Schuller
# Author:: Mara von Kroge
# 10.Januar 2018
# Mastermind - Input/Output

require_relative 'mastermind.rb'
require_relative 'mastermind_ai_codebreaker.rb'
require_relative 'mastermind_ai_codebreaker.rb'

class MastermindIO
  
  def start
    puts "___  ___             _                           _             _" 
    puts "|  \\/  |            | |                         (_)           | |"
    puts "| .  . |  __ _  ___ | |_   ___  _ __  _ __ ___   _  _ __    __| |"
    puts "| |\\/| | / _` |/ __|| __| / _ \\| '__|| '_ ` _ \\ | || '_ \\  / _` |"
    puts "| |  | || (_| |\\__ \\| |_ |  __/| |   | | | | | || || | | || (_| |"
    puts "\\_|  |_/ \\__,_||___/ \\__| \\___||_|   |_| |_| |_||_||_| |_| \\__,_|"
    puts "_________________________________________________________________\n\n"
    puts "\nWelcome to MasterMind, Buddy!"
    puts "the concept of this logic game is that the Codemaker generates a secret"
    puts "code the Codebreaker tries to guess right."
    puts "Please seperate the numbers you are guessing with a space, example:  1 1 2 2."
    puts "\"cheat\" shows you the solution, \"tipp\" gives you a tip."
    puts "Good luck, have fun!"
    
    
    # Regeln 
    # Mensch ist Codemaker und Computer ist Codebreaker oder andersherum
    while(true) do
      puts "Do you want to solve a code (1), or let your code be solved by the Computer? (2)"
      who_solves = gets.chomp
      if who_solves == "1"
        puts "You are the codesolver!"
        break
      elsif who_solves == "2"
        puts "The Computer is going to solve the code!"
        break
      else
        puts "Error. Please type \"1\" or \"2\" for your choice."
      end
    end
    setup(who_solves)
  end
  
  # Regeln 
  # Codeläge, Rundenanzahl sowie wie viele Codeelemente
  def setup(who_solves)
    if (who_solves == "1") #Player solves code
      puts "Play with normal rules (1) or change rules? (2)"
      while(true) do
        rules = gets.chomp
        if rules == "1"
          puts "We will play with normal rules"
        elsif rules == "2"
          puts "Ok, we will let you change the rules."
          break
        else
          "Error. Please type \"1\" or \"2\" for your choice."
        end
      end
      if (rules == "2")
        while(true) do
          puts "Length of code? (Standard is 4)"
          length_of_code = gets.chomp
          if ((1..10).include?(length_of_code.to_i))
            puts "Length of code:" + length_of_code.to_s
            break
          else
            puts "Error: Please choose a length from 1 to 10."
          end
        end
        while(true) do
          puts "How many numbers? (Standard is 6)"
          amount_of_numbers = gets.chomp
          if ((1..10).include?(amount_of_numbers.to_i))
            puts "Amount of numbers: #{amount_of_numbers}"
            break
          else
            puts "Error: Please choose a length from 1 to 10."
          end
        end
        while(true) do
          puts "How many rounds? (Standard is 10)"
          amount_of_rounds = gets.chomp
          if ((1..100).include?(amount_of_rounds.to_i))
            puts "Amount of rounds: #{amount_of_rounds}"
            break
          else
            puts "Error: Please choose a length from 1 to 100."
          end
        end
        player_solves(length_of_code, amount_of_numbers, amount_of_rounds)
      end
    end
    
    # Computer ist Codebreaker
    if (who_solves == "2")
      puts "Now you have to generate your secret code:"
      @mmai = MastermindAICodebreaker.new(self)
      @mmai.new_game_ai
    end
  end
  
  # Mensch ist Codebreaker
  def player_solves(length_of_code, amount_of_numbers, amount_of_rounds)
    puts "Player is going to solve the code!"
    puts "Length of code: #{length_of_code.to_i}"
    puts "Amount of numbers: #{amount_of_numbers.to_i}"
    puts "Amount of rounds: #{amount_of_rounds.to_i}"
    
    @mm = Mastermind.new(length_of_code.to_i, amount_of_numbers.to_i, amount_of_rounds.to_i, self)
    @mm.new_game
  end

  
  def print_new_game
    puts "\n\n-----NEW-GAME-----"
  end
  
  def print_valid_elements(elements)
    puts "Valid Elements: #{elements}"
  end
  
  
  # Mensch ist Codemaker
  # Code des Menschen, welchen Computer versucht zu erraten
  def generate_code_human
    @elements = [1,2,3,4,5,6]
    puts "Your Code the Computer will guess right:"
    @input = gets.chomp.split(" ")
    @input.map! {|number| number.to_i}
    @input.each {|number| 
      if !@elements.include?(number)
        puts "Please enter valid numbers (1,2,3,4,5,6)."
        generate_code_human        
      end
      }
  end
  
  # Mensch ist Codebreaker
  # Eingabe des Menschen
  def input_code(code, elements, length)
    a = 1
    while(a==1) do
      # Eingabe des Menschen
      puts "Your Code:"
      input = []
      input = gets.chomp.split(" ")
      
      # Tipp/Cheat für den User
      if input == ["tipp"]
        puts "For real...?"
        puts "You can find the color #{code.sample} in the code."
      elsif input == ["cheat"]
        puts "Weakness disgusts me...!"
        puts "Solution: #{code}"
        
      # Neues Game
      elsif input == ["restart"]
        @mm.new_game
      #Reset Mastermind
      elsif input == ["new"]
        start
      # Aufhören
      elsif input == ["exit"]
        exit
      else
        if input.length == length
          # Überprüfung der Eingabe
          input.each { |value|
            if !elements.to_s.include?(value)
              puts "Error! Please put numbers #{elements}"
              a=1
              break
            else
              a=0
            end
          }
        else
          puts "Error: no valid input. Allowed length of code: #{length}"
          puts "Allowed Numbers: #{elements}"
        end
      end
    end
    return input
  end
  
  # Tabellarische Übersicht über Black und White Hits
  def table(round, protocol, black_hits, white_hits, length)
    puts "Round: " + (round+1).to_s
    printf "|"
    (length-2).times do
      printf "  "
    end
    printf "Your Codes"
    (length-2).times do
      printf "  "
    end
    puts "| Black | White |"
    i = 0
    while(i < round + 1) do
      protocol_string = ""
      
      protocol[i].each_index { |index|
        protocol_string << protocol[i][index].to_s << "   "
      }
      printf "|  "
      if length == 1
        printf "    "
      end
      puts protocol_string.to_s + "|   "\
      + black_hits[i].to_s + "   |   " + white_hits[i].to_s + "   |"
      i+=1
    end
  end
    
  # Man hat gewonnen.  
  def win
    puts "THE CODE HAS BEEN SOLVED!!!"
    another_game
  end
  
  # Man hat verloren.
  def lost(code, round, amount_of_rounds)
    puts "#{round} out of #{amount_of_rounds} rounds. You lost! ^_^"
    puts "The code was: #{code}."
    another_game
  end
  
  def another_game
    while(1) do
      puts "Do you wanna play another game? (y/n)"
      a = gets.chomp
      if a == "y"
        @mm.new_game()
      elsif a == "n"
        puts "See ya!"
        exit
      else
        puts "Input Error"
      end
    end
  end
end
