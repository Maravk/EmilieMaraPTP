# Author: Emilie Schuller, Mara von Kroge, 10. November 2017
# TeamChallenger
# Modellierung
# Klasse Teil

class Teil
  include Enumerable
  include Comparable 
  @teil=Array.new
  
  # Initialize
  # Teile und Ganzes immer zu einem Array.
  # Beschreibung immer zu einem String.
  # Masse immer zu einer Zahl. 
  def initialize (teil, ganzes, beschreibung, masse)
    @teil = teil.to_a
    @ganzes = ganzes.to_a
    @beschreibung = beschreibung.to_s
    @masse = masse.to_i
  end
  
  # Teil zu Teil hinzufügen.
  def add_teil(teil)
    if !@teil.include?(teil)
    @teil << teil
  end
  
  # Teile zu Teile hinzufügen.
  def add_teile(teile)
    if !@teile.include?(teile)
      @teile << teile 
    end
  end
  
  # Teil entfernen.
  def remove_teil(teil)
    @teil.delete(teil)
  end
  
  # Etwas zum Ganzen hinzufügen.
  def add_to_ganzes(ganzes)
    if !@ganzes.include?(ganzes)
    @ganzes << ganzes
  end
  end 
  
  # Etwas vom Ganzen entfernen.
  def remove_from_ganzes(ganzes)
    @ganzes.delete(ganzes)
  end
  
  # Methode to_s überschreiben 
  # Elemente werden nicht im Array als String ausgegeben, 
  # sondern als Strings.
  # Teil als String ausgeben.
  def to_s
    @teil.map(&:to_s)
  end
  
  # Erstes Teil von Teil ausgeben.
  def get_top
   puts @teil.first 
  end
end 
end 