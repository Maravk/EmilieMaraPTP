# Author: Emilie Schuller, Mara von Kroge, 10. November 2017
# TeamChallenger
# Modellierung
# Klasse Teil

class Ganzes
  @ganzes=Hash.new
end 

class Teil < class Ganzes
  include Enumerable
  @teil=Hash.new
  
  def initialize (beschreibung, masse)
    @beschreibung = beschreibung.to_s
    @masse = masse.to_i
  end
  
  def add_teil(teil)
    @teil << teil
  end
  
  def remove_teil(teil)
    @teil.delete(teil)
  end
  
  def add_to_ganzes(ganzes)
    @ganzes << ganzes
  end
  
  def remove_from_ganzes(ganzes)
    @ganzes.delete(ganzes)
  end
  
  def to_s
    @teil.to_s
  end
  
  def get_top
   puts @teil.first 
  end
end 
end 
class Teile < class Teil
  @teile=Array.new
end
end