# Author:: Ralf Herrmann, Mara von Kroge, Emilie Schuller
# 29.11.2017
# TeamNilClass
# Klasse zu MasterMind - Computer ist Codemaker

class MasterMind
  include Enumerable
  include Comparable
    
  def initialize(elements, length)
    @elements = ["Yellow", "Blue", "Red", "Green", "Pink", "Grey"]
    @length = [0,1,2,3]
  end
  

 
 
  # Variante: Computer ist Codemaker
 kombination_computer = []
 
 kombination_computer1 = rand(1..6)
 if kombination_computer1 == 1
   kombination_computer.add(@elements[0])  
 end
 
 komination_computer2 = rand(1..6)
 if kombination_computer2 == 2
   kombination_computer.add(@elements[1])
 end
 
komination_computer3 = rand(1..6)
 if kombination_computer3 == 3
   kombination_computer.add(@elements[2])
 end
 
komination_computer4 = rand(1..6)
 if kombination_computer4 == 4
   kombination_computer.add(@elements[3])
 end
 
komination_computer5 = rand(1..6)
 if kombination_computer5 == 5
   kombination_computer.add(@elements[4])
 end
 
komination_computer6 = rand(1..6)
 if kombination_computer6 == 6
   kombination_computer.add(@elements[5])
 end
 
 
end
