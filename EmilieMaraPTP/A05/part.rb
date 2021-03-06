# Author: Emilie Schuller, Mara von Kroge
# TeamChallenger
# 20.11.2017
# Class Part

class Part
  include Enumerable
  
  
  # Initialize
  # Parts ist hierbei immer ein Array und die Masse ein Float.
  def initialize(name, mass, parent = nil)
    @name = name
    @parts = {}
    @mass = 0.0
    @parent = parent
    
    
    # Sofern Masse nil entspricht, ist diese 0 Kg.
    if(@mass == nil)
      @mass = 0.0
    end
    
    # Sofern der Name nil entspricht, ist dieser ein leerer String.
    if(@name == nil)
      @name = ''
    end
    
  end
  

  
  # Schreibe den Inhalt in eine Datei
  def write_to_file
    size = self.size_parts()
    filename = "A05/" << @name
    content = @name << "\n" << size.to_s << "\n" << @parts.to_s << "\n" << @mass.to_s
    File.write(filename, content)
  end
  
  def load_from_file(filename)
    line = IO.readlines(filename)[0]
    @name = line
    line = IO.readlines(filename)[1]
    number_of_parts = line.to_i
    line = IO.readlines(filename)[2]
    words = line.split(/\W+/)
    i = 0
    array = 0
    while (i < number_of_parts)
      @parts[words[array]] = (@parts[words[array + 1]].to_f)
      i = i+1
      array = array + 2
    end
    puts @parts["Reifen"]
    puts @parts["Motor"]
  end
  
  # Jeweiliges oberstes Teil
  def parent
    return @parent
  end
  
  # Gesamtgewicht in Kg.
  def total_weight
    if(self.size_parts == 0)
      return @mass
    end
    
  # Der Masse wird 0 zugewiesen, auf diese wird die Summierung der einzelnen Massen addiert. 
    mass = 0.0
    @parts.each {|key, value| mass += value}
      return mass
  end
  
  # Anzahl an Teilen
  def total_size
    @parts.length
  end
  
  # Hat ein Teil die Masse 0, wird das Gesamtgewicht ausgegeben.
  def mass
    if(@mass == 0.0)
      return self.total_weight
    end
    return @mass
  end
  
  # Name eines Teils.
  def name
    return @name
  end
  
  # Neuer Name eines Teils.
  def name=new_value
    @name = new_value
  end
  
  # Each-Methode
  def each
    @parts.each {|part| puts part}
  end
  
  # Hinzufügen eines Teils.
  def add_part(name, mass)
    @parts[name] = mass
  end
  
  # Ausgabe aller Teile eines Teils.
  def all_parts
    return @parts
  end
  
  # Ausgabe des obersten Teils 
  def top
    if @parent == nil
      return self
    end
    return self.parent.top
  end
  
  # Teil entfernen.
  def remove_part(part)
    @parts.delete(part)
    return self
  end
  
  # Teil mit einem neuen Teil ersetzen.
  def replace_new_part(new)
    @parts.delete(@parts)
    new.parent = self
    @parts.push(new)
    return self
  end
  
  # Anzahl der Teile
  def size_parts
    return @parts.size
  end
  
  # Schaut, ob parts Elemente enthält.
  def empty?
    return @parts.empty?
  end
  
  # Vergleich
  def == (part)
    if(self.name == part.name && self.mass == part.mass && @parts == part.all_parts)
      return true
    end
    return false
  end

  # to_s-Methode
  def to_s
    myhash = {@name => @mass}
    puts "___________________________________"
    myhash.each {|a, b| 
      printf("|Stück: %s  |  Masse in Kilogramm: %s|\n", sprintf("%15s", a), sprintf("%5s", b))
    }
  end

end
