# Author:: Ralf Herrmann, Mara von Kroge, Emilie Schuller
# 29.11.2017
# TeamNilClass
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  include Enumerable
  include Comparable
    
  def initialize(elements = 6, length = 4)
    @elements = ["Yellow", "Blue", "Red", "Green", "Pink", "Grey"]
    @length = [0,1,2,3]
  end
  
  # Kombination des Computers wird zufällig generiert.
  def kombination_computer
 kombination_computer = []
 
   while kombination_computer.length < 4 do
   kombination_computer1 = rand(1..6) 
#p kombination_computer
   if kombination_computer1 == 1
   kombination_computer << (@elements[0])   
   end 
 #    p kombination_computer
   if  kombination_computer1 == 2
   kombination_computer << (@elements[1])
   end
#    p kombination_computer
   if kombination_computer1 == 3
   kombination_computer << (@elements[2])
   end
#p kombination_computer
   if kombination_computer1 == 4
   kombination_computer << (@elements[3])
   end
#p kombination_computer
   if kombination_computer1 == 5
   kombination_computer << (@elements[4])
   end
#p kombination_computer
   if kombination_computer1 == 6
   kombination_computer << (@elements[5])
   end
p kombination_computer
end 

def 
end 
end
end  

emi=MasterMind.new
emi.kombination_computer