# Author:: Ralf Herrmann, Mara von Kroge, Emilie Schuller
# 29.11.2017
# TeamNilClass && TeamChallenger
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  include Enumerable
  include Comparable
    
  def initialize(elements = 6, length = 4)

    @elements = [:yellow, :blue, :red, :green, :pink, :grey]
    @length = [0,1,2,3]
  end
  
  # Kombination des Computers wird zufällig generiert.
  def kombination_computer
 @kombination_computer = []
 
   while @kombination_computer.length < 4 do
   kombination_computer1 = rand(1..6) 
#p kombination_computer
   if kombination_computer1 == 1
   @kombination_computer << (@elements[0])   
   end 
 #    p kombination_computer
   if  kombination_computer1 == 2
   @kombination_computer << (@elements[1])
   end
#    p kombination_computer
   if kombination_computer1 == 3
   @kombination_computer << (@elements[2])
   end
#p kombination_computer
   if kombination_computer1 == 4
   @kombination_computer << (@elements[3])
   end
#p kombination_computer
   if kombination_computer1 == 5
   @kombination_computer << (@elements[4])
   end
#p kombination_computer
   if kombination_computer1 == 6
   @kombination_computer << (@elements[5])
   end
  p @kombination_computer
end  

#def ==(array)
#end 

# Kombination des Computers wird versucht zu erraten
def ermitte_kombination_computer
i = 0
while i <= 9 do
  
  eingabe_mensch_konsole = gets.chomp.to_s
  eingabe_mensch = []
    eingabe_mensch << eingabe_mensch_konsole
    
  if eingabe_mensch.include?(@kombination_computer.each{|a,b,c,d| a || b || c || d}) 
    puts "Indirekter Treffer! Eine Ihrer ausgewählten Farben hat der Computer auch ausgewählt!"
  else 
    puts "Leider keine Ihrer ausgewählten Farben scheint richtig zu sein!"
  end
  
  if eingabe_mensch.eql?(@kombination_computer)
    puts "Yeha! Sie haben die Kombination des Computers erraten!! Möchten Sie noch eine Runde spielen?(J/N)"
#    eingabe = gets.chomp
#    if eingabe == "J"
#      return #Anfang
#    else 
#      # Ende 
#    end
#    end 
#  
  i += 1
    end 
end
end
end 
end
