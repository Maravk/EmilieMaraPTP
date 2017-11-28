# Author: Emilie Schuller, Mara von Kroge, 24. November 2017
# TeamChallenger
# Klasse Part

class Part
  include Enumerable
  def initialize(name, mass, parent = nil)
    @name = name
    @mass = 0.0
    @mass = mass
    @parts = []
    @parent = parent
  end
  
  def name()
    return @name
  end

  def parent()
    return @parent
  end
  
  def mass_of_this()
    return @mass
  end
  
  def all_parts()
    return @parts
  end
  
  def set_name(name)
    @name = name
  end
  
  def set_mass(mass)
    @mass = Float(mass)
  end
  
  def set_parent(parent)
    @parent = parent
  end
  
  # Entfernt ein Teil aus der Liste
  def remove(part)
    if part == nil
      raise IOError("Please remove a valid part!")
    end
    @parts.delete(part)
    return self
  end
  
  #Gibt die Anzahl der Teile, aus denen ein Ganzes besteht, zurück, aber nicht mit der Anzahl Teile von Teilen
  def parts_amount()
    return @parts.size()
  end
  
  def total_parts_amount()
    amount = self.parts_amount()
    @parts.each{|part| amount += part.total_parts_amount() }
    return amount
  end

  #Gibt die Masse des Ganzen zurück, falls es nicht noch aus anderen Teilen besteht
  #Sonst wird die Masse aller Teile und des Ganzen zurück gegeben
  def mass_of_all()
    if(self.parts_amount() == 0)
      return @mass
    end
    mass = 0
    @parts.each { |value|
      mass += value.mass_of_all()
    }
    mass += @mass
    return mass
  end
  
  
  #Wenn dieses Teil kein Gewicht hat, wird das Gesamtgewicht der Teile aus dem dieses besteht zurück gegeben.
  def mass()
    if(@mass == 0)
      return self.mass_of_all()
    end
    return @mass
  end
  
  # Definierung der each Methode
  def each(&block)
      @parts.each{ |part|
        block.call(part)
      }
  end
  
  #trägt ein Objekt in den Array dieses Teils ein, in dem die Teile stehen aus dem dieses Teil besteht
  def add_part(part)
    if part == nil
      raise TypeError("Please add a valid name!")
    end
    part.set_parent(self)
    @parts.push(part)
    return self
  end
  
  # Jedes Einzelteil wird mit seiner jeweiigen Masse darstgestellt 
  def parts_and_mass()
    list = ""
    @parts.each { |value|
      list << value.name << ": " << value.mass_of_all.to_s << "\n"
    }
    return list
  end
  
  # Oerstes Teil
  def top()
    if(@parent.nil?)
      return self
    end
    return self.parent().top()
  end
  
  # Prueft, ob der Array Teile enthaelt
  def empty?()
    return @parts.empty?()
  end
  
  #Gibt Eigenschaften und Teile eines Ganzen in einer Tabelle aus
  def part_table()
    printf("Teil: %s     Masse: %s   |\n", sprintf("%-18s", @name), sprintf("%8d", self.mass))
    puts " _________________________________________________"
    puts "|          Teil          |    Masse in Kilogramm  |"
    puts "|_________________________________________________|"
    @parts.each { |part|
      printf("|    %s  |     %s          |\n", sprintf("%-18s", part.name), sprintf("%9d", part.mass_of_all))
    }
    puts "|_________________________________________________|"
  end
  
  def remove(part)
    if part == nil
      raise IOError("Please remove a valid part!")
    end
      @parts.delete(part)
  end
  
  # Ersetzt ein Teil aus der Liste
  def replace(part, new)
    if part == nil || new == nil
      raise IOError("Please replace a valid part!")
    end
    @parts.delete(part)
    new.parent = self
    @parts.push(new)
  end
  
    def replace(part, new)
    if part == nil || new == nil
      raise IOError("Please replace a valid part!")
    end
    @parts.delete(part)
    new.set_parent(self)
    @parts.push(new)
    return self
  end
end
