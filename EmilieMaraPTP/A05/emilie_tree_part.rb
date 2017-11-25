# Author: Mara von Kroge, Emilie Schuller
# TeamChallenger
# 22. November 2017
# Part-Klasse

class Part
  include Enumerable
  attr_accessor :part, :parts
  def initialize( part, parts={}, mass = nil, parent = nil)
    @parent = parent
    @part = part
    @parts = parts
    @mass = mass

  
    if (@mass == nil)
      @mass = 0.0
    end
    if (@part == nil)
      @part = ""
    end
    if (@parent == nil)
      @parent = Object.new
      @parent = @part[0]
    end
    endlol

  # To_s
  def to_s(indent = 0)
    part_s = @part.to_s
    sub_indent = indent + part_s.length
    part_s + @parts.map { |parts| " ~ " + parts.to_s(sub_indent + 3)}.join("\n" + ' ' * sub_indent)
  end
  
  # Teile hinzufügen.
  def add_part (part, mass)
    @parts[part] = mass
  end
  
  # Einzelteile hinzufügen.
  def add_parts (index, name, gewicht)
    @mass.push([gewicht])
    @part[index].push(name)
  end

  #Each
  def each(parts_index0, parts_index1)
    @parts[parts_index0][pars_index1].each do |name, gewicht|
      puts "             Beschreibung: #{name}"
      puts "             Gewicht     : #{gewicht} Kilogramm"
    end
  end

  # Altes Teil mit neuem Teil ersetzen.
  def replace_new_part(deleted_part, new_mass, new_part, description)
    @parts.delete_at(deleted_part)
    @mass.push([new_mass])
    @parts.push(new_part = {description => @mass[new_mass][new_mass], description => @mass[new_mass][new_mass]})
  end
  
  # Empty?
  def empty?
    return @parts.empty?
  end

  # Einzelteil entfernen.
  def remove_part(deleted_parts)
    @parts.each {|h| h.delete(deleted_parts)}
  end

  # Oberstes Einzelteil.
  def top
 #   return @parent
    @parts[0].first.each {|name, gewicht| puts "#{name}"}
  end

  # Vergleich
  def == (part)
    if(self.part() == part.part() && self.mass() == part.mass() && @parts == part.all_parts())
      return true
    end
    return false
  end
  
  def write_to_file
    filename = "A05/" << @part.to_s
    content = @part << "\n" << @parts.length.to_s << "\n" << @parts.flatten.to_s << "\n" << @mass.to_s << "\nParent: " + @parent.to_s
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
  
end
 


# Skript
auto = Part.new("Auto", %w{ Karosserie Reifen Sitze Spiegel Motor}.map {|str| Part.new(str)})
  puts "Darstellung der Stückliste Auto"
  puts auto
    

@mass = [[100, 170, 20, 200], [20, 10], [45], [2, 0.5], [20, 2, 35, 5]] 
@parts = [karosserie = {"Metall" => @mass[0][0], "Kotflügel" => @mass[0][1], "Scharniere" => @mass[0][2], "Türen" => @mass[0][3]}, reifen = {"Gummi" => @mass[1][0], "Felgen" => @mass[1][1]}, sitze = {"Leder" => @mass[2][0]}, spiegel = {"Glas" => @mass[3][0], "Halterung" => @mass[3][1]}, motor = {"Schläuche" => @mass[4][0], "Kolben" => @mass[4][1], "Aggregatetrieb" => @mass[4][2], "Kurbelwelle" => @mass[2][3]}]
  puts "Einzelteile von Auto"
  puts "--> Karosserie:"
@parts[0].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Reifen:"
@parts[1].each do |name, gewicht|
    puts "             Beschreibung: #{name}"
    puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Sitze:"
@parts[2].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Spiegel:"
@parts[3].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
 puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Motor:"
@parts[4].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end
puts ''

# Teil hinzufügen.
puts "Es wird das neue Teil Navigation hinzugefügt."
@mass.push([1.11, 2.89])
@parts.push(navigation = {"Technik" => @mass[5][0], "Kabel" => @mass[5][1]})

puts "--> Navigation:"
@parts[5].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

# Teil austauschen.
puts "Das Teil Sitze wird nun mit Fernseher ausgetauscht."
@parts.delete_at(2)
@mass.push([1.4, 0.2])
@parts.push(fernseher = {"Gehäuse" => @mass[6][0], "Kabel" => @mass[6][1]})

puts "--> Fernseher:"
@parts[5].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end
puts''

  # Einzelteil löschen.
puts "Das Einzelteil Kurbelwelle in Motor wird gelöscht."
@parts.each {|h| h.delete("Kurbelwelle")}

# Anzahl an Teilen.
puts "Die Stückliste Auto besitzt insgesamt #{@parts.length} Teile."

# Gesamtmasse
mass0 = @mass[0].inject(0,:+)
mass1 = mass0 + @mass[1].inject(0,:+)
mass2 = mass1 + @mass[2].inject(0,:+)
mass3 = mass2 + @mass[3].inject(0,:+)
mass4 = mass3 + @mass[4].inject(0,:+)
mass5 = mass4 + @mass[5].inject(0,:+)
puts "Die Stückliste Auto hat eine Gesamtmasse von #{mass5} Kilogramm."
puts''

# Oberstes Teil
puts "Das oberste Einzelteil des Teils Reifen ist:"
@parts[0].first.each {|name, gewicht| puts "#{name}"}
puts ''

puts "Sind Karosserie und Reifen identisch?"
puts @parts[0] == @parts[1]
puts ''
puts "Sind Karosserie und Karosserie identisch?"
puts @parts[0] == @parts[0]

auto.write_to_file()