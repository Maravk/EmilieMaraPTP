# Author: Emilie Schuller, Mara von Kroge, 10. November 2017
# TeamChallenger
# Modellierung
# Klasse Teil

#class Ganzes
#  @ganzes=Hash.new
#end 

class Teil
  include Enumerable
  include Comparable 
  @teil=Hash.new
  
  def initialize (teil, ganzes, beschreibung, masse)
    @teil = teil.to_a
    @ganzes = ganzes.to_a
    @beschreibung = beschreibung.to_s
    @masse = masse.to_i
  end
  
  def add_teil(teil)
    if !@teil.include?(teil)
    @teil << teil
  end
  
  def add_teile(teile)
    if !@teile.include?(teile)
      @teile << teile 
    end
  end
  
  def remove_teil(teil)
    @teil.delete(teil)
  end
  
  def add_to_ganzes(ganzes)
    if !@ganzes.include?(ganzes)
    @ganzes << ganzes
  end
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
#class Teile < class Teil
#  @teile=Array.new
#end 