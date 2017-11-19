# Author: Emilie Schuller, Mara von Kroge, 10. November 2017
# TeamChallenger
# Modellierung
# Klasse Teil

#https://www.ruby-forum.com/topic/60329 

class Teil
  include Enumerable
  include Comparable 
  
  # Initialize
  # Teile und Ganzes immer zu einem Array.
  # Teil immer zu einem Hash.
  # Masse immer zu einer Zahl. 
  def initialize (ganzes, teil, teile, masse)
    @ganzes = ganzes.to_h
    @teil = teil.to_h
    @teile = teile.to_h
    @masse = masse.to_a
  end

  @myhash = {@ganzes => {{@teil => @masse} => @teile}}
  
  # Teil zu Teil hinzufügen.
  def add_teil(teil)
    if !@teil.include?(teil)
    @teil << teil
  end
  end 
  
  # Teile zu Teile hinzufügen.
  def add_teile(teile)
    if !@teile.include?(teile)
      @teile << teile 
    end
    end
  
  # Teil entfernen.
  def remove_teil(key)
    @teil.delete(key)
  end
  
  # Etwas zum Ganzen hinzufügen.
  def add_to_ganzes(ganzes)
    if !@ganzes.include?(ganzes)
    @ganzes << ganzes
    end
  end 
  
  # Etwas vom Ganzen mit einem Anderen austauschen.
  def replace_ganzes(ganzes)
    if !@ganzes.include?(ganzes)
      @ganzes.replace(ganzes)
    end
  end
  
  # Etwas vom Ganzen entfernen.
  def remove_from_ganzes(ganzes)
    @ganzes.delete(ganzes)
  end
  
  # Methode to_s überschreiben. 
  # Elemente werden nicht im Array als String ausgegeben, 
  # sondern als Strings.
  # Teil als String ausgeben.
  def to_s
    @teil.map(&:to_s)
  end
  
  # Erstes Teil von Teil ausgeben.
  def get_top
    @teil.first.each_key {|key| puts key}
  end
  
  # Masse von einem Teil ausgeben.
  def mass_teil
    @mass.reduce(:+)
   # @teile.values.map.reduce(:+)
  end 
end 