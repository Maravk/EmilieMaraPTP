# Author: Emilie Schuller, Mara von Kroge, 10. November 2017
# TeamChallenger
# Modellierung
# Klasse Teil

class Ganzes
  @ganzes=Array.new
end

class Teil < class Ganzes
  include Enumerable
  @teil=Array.new
  
  def initialize (beschreibung, menge)
    @beschreibung = beschreibung.to_s
    @menge = menge.to_i
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
  
  def ganzes
    
  end
  
  def get_top
   puts @teil.first 
  end
end

class Teile < class Teil
  @teile=Array.new
end
end 
end