# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 18. Dezember 2017
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  
  def initialize()
    # Die zur Verfügung stehenden Farben
    @elements = ["pink", "blue", "yellow", "green", "grey", "red",1,2,2,3,4,5,6]
    @round = 0
    # 10 Runden insgesamt
    @amount_of_rounds = 10
    # Die festgelegte Länge einer Ratekombination.
    @length = 4
  end
  
  def new_game
    puts "\n\n-----NEW-GAME-----"
    @round = 0
    generate_code
    game_loop
  end
  
  
  # Vierstellige Kombination des Computers wird zufällig generiert.
  def generate_code
    @code = Array.new
    a = 0
    while(a < @length) do
      @code[a]= rand(1..6).to_s
      a += 1
    end
  end

  
  # Mensch gibt seinen Rateversuch ein.
  def input_code
    a = 1
    while(a==1) do
      # Eingabe des Menschen
      puts "Your Code:"
      @input = []
      @input = gets.chomp.split(" ")
      
      # Tipp/Cheat für den User
      if @input == ["t"]
        puts "Die Farbe #{@code.sample} ist enthalten."
      elsif @input == ["cheat"]
        puts "Solution: " + @code.to_s
        
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
            puts "Error! (pink = 1, blue = 2, yellow = 3, green = 4, grey = 5, red = 6)"
            a=1
            break
          else
            a=0
          end
        }
      end
    end
  end 
  
  
  def game_loop
    
    # Eingabe des Users
    protocol = []
    # Direkte Treffer
    black_hits = []
    # Indirekte Treffern  
    white_hits = []
    
    while (true) do
      # Eingabe des Menschen.
      input_code
      # Für jeden neuen Durchgang werden die Zähler für die Direkten und 
      # indirekten Treffer auf null gesetzt.
      @black_hits = 0
      @white_hits = 0
      
      # Stets werden zwei Codes miteinander verglichen. 
      hits = compare_codes
      @black_hits = hits[0]
      @white_hits = hits[1]
      
      # Jeweils pro Runde neuer Input, neue Anzahl an Black und White Hits.
      protocol[@round] = @input
      black_hits[@round] = @black_hits
      white_hits[@round] = @white_hits

        
      # Ausgabe auf die Konsole bezüglich der Anzahl der Direkten und Indirekten Treffer.
      puts "Round: " + (@round+1).to_s
      puts "|  Your Codes  | Black | White |"
      i = 0
      while(i < @round+1)
        protocol_string = ""
        
        # Jede neue Runde wird als eine Art Tabelle auf die Konsole ausgegeben.
        protocol[i].each_index { |index|
          protocol_string << protocol[i][index].to_s << "  "
        }
        puts "|  " + protocol_string.to_s + "|   "\
        + black_hits[i].to_s + "   |   " + white_hits[i].to_s + "   |"
        i+=1
      end
      
      # Spiel gewonnen, sobald vier Direkte Treffer erzielt wurden.
      if @black_hits == 4
        puts 'THE CODE HAS BEEN SOLVED!!!'
        while(1) do
          
          # Neues Game.
           puts "Do you want to play another game? (y/n)"
           a = gets.chomp
           if a == "y"
             puts "\n\n-----NEW-GAME-----"
             generate_code
             game_loop
           elsif a == "n"
             exit
           end
        end
      end
      @round += 1
      
      # Bis alle Runden vorbei sind.
      if @round == @amount_of_rounds
        puts "10 out of 10 rounds. You lost! ^_^"
        puts "The code was: " + @code.to_s
        break
      end
    end
    while(1) do
      puts "Do you wanna play another game? (y/n)"
      a = gets.chomp
      if a == "y"
        new_game
      elsif a == "n"
        exit
      end
    end        
  end


  # Vergleicht zwei Codes und gibt die Anzahl der Direkten und Indirekten Treffer zurück.
  def compare_codes

    black_hits = 0
    white_hits = 0
    temp_code = @code.clone
    temp_input = @input.clone
    
    # Direkte Treffer
    temp_code.each_index { |index|
      if temp_code[index] == temp_input[index]
        black_hits += 1
        temp_input[index] = -1
        temp_code[index] = -2
      end
    }
    
    # Indirekte Treffer
    temp_code.each_index { |index|
      temp_input.each_index { |index2|
        
        if temp_input[index2] == temp_code[index]
          white_hits += 1
          temp_input[index2] = -1
          temp_code[index] = -2
        end
      }
    }
    return [black_hits, white_hits]
  end
end