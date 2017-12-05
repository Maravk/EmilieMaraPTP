# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 01.12.2017
# MasterMind - Mensch ist Codemaker - Klasse

class MasterMindAi
  include Enumerable
  include Comparable
  
  def initialize(elements = 6, length = 4)
    
    @elements = ["yellow", "blue", "red", "green", "pink", "grey"]
    @length = [0,1,2,3]
  end
  
  # Kombination wird vom Menschen ausgewählt.
  def kombination_mensch
  kombination_mensch_konsole = gets.chomp.to_s
  @kombination_mensch = []
  @kombination_mensch = kombination_mensch_konsole.split(" ")
  end 

  # Computer versucht, die Kombination zu erraten.
  # Läuft bisher, aber wir müssen ja noch die Methode adden,
  # dass wenn es einen indirekten Treffer gab, die Farbe beim nächsten
  # Durchlauf an einer anderen Stelle steht und das bei einem
  # direkten Treffer die Farbe im nächsten Durchlauf wieder an
  # der gleichen Stelle steht 
  
  
  # Versuch des Knuth-Algorithmus'
def ermittle_mensch_kombination
  
  # Step 1
  # Set aus allen möglichen Farbkombinationen (1296 Möglichkeiten)
  alle_kombinationen = ["yellow", "blue", "red", "green", "pink", "grey"]
    alle_kombinationen.repeated_permutation(4).to_a
 
    
  i = 1
  while i < 2 do
  
    # Computer soll mit dem "initial guess" (am häufigsten gewählte Kombination) starten, und zwar 1122
    erratene_kombination_computer = []
    erratene_kombination_computer << (alle_kombinationen[0])
    erratene_kombination_computer = erratene_kombination_computer << (alle_kombinationen[0])
    erratene_kombination_computer = erratene_kombination_computer << (alle_kombinationen[1])
    erratene_kombination_computer = erratene_kombination_computer << (alle_kombinationen[1])
    
    
    # Antwort des Spielers bezüglich direkter und indirekter Treffer
      @white = 0
      @black = 0
      
      n = 0
      while (n < 4)
        if erratene_kombination_computer[n] == @kombination_mensch[n]
          @black +=1
          erratene_kombination_computer = erratene_kombination_computer << [@kombination_mensch[n]] 
         
      elsif erratene_kombination_computer.include?(@kombination_mensch[n])
        @white += 1
        erratene_kombination_computer = erratene_kombination_computer[n]

      end 
        n+=1    
      end 
      puts "Runde #{i}"
      puts "    Der Computer hat #{@white.to_s}-mal einen indirekten Treffer!\n"
      puts "    Der Computer hat #{@black.to_s}-mal einen direkten Treffer!\n\n" 
     
      until erratene_kombination_computer.length == 3
      erratene_kombination_computer.push(@kombination_mensch.sample, @kombination_mensch.sample, @kombination_mensch, @kombination_mensch)
      end
      
        if erratene_kombination_computer == @kombination_mensch
          puts "Yea! Der Computer hat Ihren Code erraten!"
        exit
        end 
end
        
  
i = 1
while i < 10 do
      
      erratene_kombination_computer = []
      erratene_kombination_computer << (alle_kombinationen.sample)
      erratene_kombination_computer = erratene_kombination_computer << (alle_kombinationen.sample)
      erratene_kombination_computer = erratene_kombination_computer << (alle_kombinationen.sample)
      erratene_kombination_computer = erratene_kombination_computer << (alle_kombinationen.sample)
      
# Antwort des Spielers bezüglich direkter und indirekter Treffer
  @white = 0
  @black = 0
  
  n = 0
  while (n < 4)
    if erratene_kombination_computer[n] == @kombination_mensch[n]
      @black +=1
      erratene_kombination_computer = erratene_kombination_computer << [@kombination_mensch[n]] 
    
     
  elsif erratene_kombination_computer.include?(@kombination_mensch[n])
    @white += 1
    erratene_kombination_computer = erratene_kombination_computer[n]

  end 
    n+=1    
  end 
  puts "Runde #{i+1}"
  puts "    Der Computer hat #{@white.to_s}-mal einen indirekten Treffer!\n"
  puts "    Der Computer hat #{@black.to_s}-mal einen direkten Treffer!\n\n" 
 
  until erratene_kombination_computer.length == 3
  erratene_kombination_computer.push(@kombination_mensch.sample, @kombination_mensch.sample, @kombination_mensch, @kombination_mensch)
  end
  
    if erratene_kombination_computer == @kombination_mensch
      puts "Yea! Der Computer hat Ihren Code erraten!"
    exit
    end 
      
      
      i += 1
      if i == 9
        puts "Mist! In 10 Versuchen hat der Computer es nicht geschafft, deine Kombination zu erraten!"
       end
     end
  end 
end 
