# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 18. Dezember 2017
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  
  def initialize()
    # Die zur Verfügung stehenden Farben
    @elements = ["pink", "blue", "yellow", "green", "grey", "red",1,2,3,4,5,6]
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
      return @codes
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
  
  def code_solver
    # Ein Array mit allen möglichen Lösungen (1111..6666)
    solutions = Array.new
    i = 0
    while(i<6**4)
      solutions[i] = (i.to_s(6)).to_i+1111
      i+=1
    end
    puts solutions
  end
  
  def change_input(input)
    @input = input
  end
  
  def change_code(code)
    @code = code
  end 
  
end


#Stack Overflow
#
#   Questions
#   Developer Jobs
#   Tags
#   Users
#
#Log In Sign Up
#Sign up × Stack Overflow is a community of 8.2 million programmers, just like you, helping each other. Join them; it only takes a minute:
#Knuth's algorithm for solving MasterMind with 5 guesses [closed]
#Ask Question
#up vote
#-2
#down vote
#favorite
# 
#
#I read knuth's algorithm in wikipedia and I wonder about the 3rd step. If I understand correct for each option (even if not removed in step 2), we calculate how many possible guesses would have removed for every ffedback. for that step we take minimum. after, we find the maximum on the minimums and take the code the max belong to it. that will be our second guess. Im not sure what can be done next because,each time we dont change the max on the minimums (or what is the minimum). In addition, how can I implement this step in c# for example. How can I procceed and how can I implement that step? What does the minimum on the feedbacks really mean?
#c# algorithm
#shareimprove this question
# 
#asked Dec 6 '13 at 7:22
#Danis Fischer
#195218
#closed as off-topic by Eric Lippert, L.B, rene, Ondrej Janacek, mdml Dec 7 '13 at 17:18
#
#This question appears to be off-topic. The users who voted to close gave this specific reason:
#
#   "Questions asking for code must demonstrate a minimal understanding of the problem being solved. Include attempted solutions, why they didn't work, and the expected results. See also: Stack Overflow question checklist" – Eric Lippert, L.B, rene, Ondrej Janacek, mdml
#
#If this question can be reworded to fit the rules in the help center, please edit the question.
#
# 
#add a comment
#1 Answer
#active
#oldest
#votes
#up vote
#4
#down vote
#accepted
# 
#
#You need a constant collection of all possible outcomes, a collection of the remaining alternatives, and a method that can compute the outcome given a guess and a solution.
#
#First, model the relevant domain objects:
#
#public class Outcome
#{
#   public int White { get; set; }
#   public int Black { get; set; }
#}
#
#public class Combination
#{
#   // however you like to model this
#}
#
#Then, create the method that checks the guess against the secret:
#
#public static Outcome Check(Combination guess, Combination solution)
#{
#   // your implementation
#}
#
#Now the algorithm is as follows:
#
#Outcome[] outcomes = new[] { new Outcome { White = 0, Black = 0 },
#                            new Outcome { White = 1, Black = 0 },
#                            // ... all other possibilities
#                           };
#
#// assume we have some list of combinations
#int min = Integer.MaxValue;
#Combination minCombination = null;
#foreach (var guess in combinations)
#{
#   int max = 0;
#   foreach (var outcome in outcomes)
#   {
#       var count = 0;
#       foreach (var solution in combinations)
#       {
#           if (Check(guess, solution) == outcome)
#               count++;
#       }
#       if (count > max)
#           max = count;
#   }
#   if (max < min)
#   {
#       min = max;
#       minCombination = guess;
#   }
#}
#
#At the end of the loop, minCombination is your next guess.
#
#EDIT I messed up min and max in the first version, that is fixed now. The inner count gives the number of remaining options, provided the chosen combination and the assumed outcome. We want the maximum over the outcomes (the worst possible result for the chosen combination is the one that leaves most options remaining). After that we want the minimum over the combinations (the best possible combination is the one that leaves least options remaining in the worst case).
#
#If you like Linq, you could also write the algorithm as
#
#combinations.MaxBy(guess =>
#       outcomes.Min(outcome =>
#               combinations.Count(solution => 
#                       Check(guess, solution) == outcome)));
#
#in which I used MaxBy from the MoreLinq project.
#shareimprove this answer
# 
#edited Dec 7 '13 at 10:46
# 
#answered Dec 6 '13 at 7:48
#Vincent van der Weele
#10.6k11847
# 
#    
# 
#thanks but what is c in check(combination,c)? – Danis Fischer Dec 6 '13 at 15:12
#    
# 
#@CoarguAliquis it's the variable of the lambda expression in count and represents the solution. In that line I count all the solutions that would lead to outcome. You could also write it as a foreach loop. – Vincent van der Weele Dec 6 '13 at 18:26
#    
# 
#where did you define it and what do you mean by "the lambada expression"? by the way i can find here only the next guess but not the one after it, can I? – Danis Fischer Dec 7 '13 at 4:35
#    
# 
#@CoarguAliquis I just updated the answer to use a foreach loop. The other version used Linq, you should look that up some time, it's really interesting, but maybe this version is easier to follow. You can just reuse this snippet over and over again to find the next guess. All you need to do is keep combinations up to date (those are the combinations that may still be the solution, based on the outcomes you received so far). – Vincent van der Weele Dec 7 '13 at 10:48
#    
# 
#thanks. afer finding minCombination I play it and reduce combinations from alreday-reduced-combinationes array? if so: why do we need to find minimax evry step suppose it doesn't change between them? – Danis Fischer Dec 7 '13 at 15:48
#show 1 more comment
