# Author: Emilie Schuller, Mara von Kroge, 24. November 2017
# TeamChallenger
# Klasse Part

class Part
  include Comparable
  include Enumerable
  def initialize(name, mass = 0.0, parent = nil)
    @name = name
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
    if !@parent.equal?(@parent)
      @parent = parent
    parent.add_part(self)
    end
    return self
  end

  # Entfernt ein Teil aus der Liste
  def remove(part)
    if part.nil?
      raise IOError.new("Please remove a valid part!")
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

  #Wenn dieses Teil kein Gewicht hat, wird das Gesamtgewicht der Teile aus dem dieses besteht zurück gegeben.
  def mass()
    if(@mass == 0)
      return self.mass_of_all()
    end
    return @mass
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

  #trägt ein Objekt in den Array dieses Teils ein, in dem die Teile stehen aus dem dieses Teil besteht
  def add_part(part)
    if part == nil
      raise TypeError.new("Please add a valid name!")
    end
    if !@parts.any?{|n| n.equal?(part)}
      part.set_parent(self)
      @parts.push(part)
    else 
      puts "Das Part ist bereits enthalten!"
    end
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
  def parts_table()
    printf("Teil: %s     Masse: %s   |\n", sprintf("%-18s", @name), sprintf("%8d", self.mass))
    puts " _________________________________________________"
    puts "|          Teil          |    Masse in Kilogramm  |"
    puts "|_________________________________________________|"
    @parts.each { |part|
      printf("|    %s  |     %s          |\n", sprintf("%-18s", part.name), sprintf("%9d", part.mass_of_all))
    }
    puts "|_________________________________________________|"
  end

  
  # Teil entfernen
  def remove(part)
    if part == nil
      raise TypeError.new("Please remove a valid part!")
    end
    @parts.delete(part)
  end

  # Ersetzt ein Teil aus der Liste
  def replace(part, new)
    if part == nil || new == nil
      raise TypeError("Please replace a valid part!")
    end
    @parts.delete(part)
    new.parent = self
    @parts.push(new)
  end

  # Part mit einem neuen ersetzen
  def replace(part, new)
    if part == nil || new == nil
      raise TypeError.new("Please replace a valid part!")
    end
    @parts.delete(part)
    new.set_parent(self)
    @parts.push(new)
    return self
  end

  # Gleichgleich
  def ==(part)
    if part.nil?
      return false
    end
    if self.equal?(part)
      return true
    end
    if self.class != part.class
      return false
    end
    return [@name, @mass, @parent, @parts] == [part.name, part.mass_of_this, part.parent, part.all_parts]
  end

  # Eql?
  def eql?(part)
    if part.nil?
      return false
    end
    if self.equal?(part)
      return true
    end
    if self.class != part.class
      return false
    end
    return [@name, @mass, @parent, @parts].eql?(part.name, part.mass_of_this, part.parent, part.all_parts)
  end
  
  
  # Rico 2
  def each
    if block_given?
    @parts.each do |value|
      yield value
      value.each do |inner_value|
        yield inner_value
      end
    end
  end     
 end
 

# Array besteht aus Hashes, in welchem die Infos für die Part-Liste stehen
  def create_dump
    dump = []
    dump.push( { id: object_id, name: @name, mass: @mass, parent: @parent.nil? ? 0 : @parent.object_id } )
    each do |part|
      part.create_dump.each do |child|
        dump.push(child)
      end
    end
    return dump
  end

  # Serializes the object in the passed file
  def self.write_in_file(part, path)
    File.open(path, 'w') do |file|
      part.create_dump.each do |part|
        file << sprintf("[id=%d,name=%s,mass=%f,parent=%d]\n", part[:id], part[:name], part[:mass], part[:parent])
      end
    end
  end

  # Deserializes the part object from the passed file
  def self.load_from_file(path)
    raise Exception.new('Passed file does not exist') unless File.file?(path)
    dump = {}
    root = nil
    File.open(path, 'r') do |file|
      while (line = file.gets)
        id = line.split('id=')[1].split(',')[0].to_i
        name = line.split('description=')[1].split(',')[0]
        mass = line.split('mass=')[1].split(',')[0].to_f
        parent = line.split('parent=')[1].split(']')[0].to_i
        part = Part.new(name, mass)
        parent > 0 ? part.parent=dump[parent] : root = part
        dump[id] = part
      end
    end
    root
  end 
    
end
