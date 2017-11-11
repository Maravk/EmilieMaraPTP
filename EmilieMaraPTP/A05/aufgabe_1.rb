# Author: Emilie Schuller, Mara von Kroge, 10. November 2017
# TeamChallenger
# Modellierung
# Klasse Teil

class Ganzes
  @ganzes=Array.new
  include Enumerable
end

class Teil < class Ganzes
  @teil=Array.new
  attr_reader :beschreibung; :menge
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
    
  end
end

class Teile < class Teil
  @teile=Array.new
end