# Author: Mara von Kroge, Emilie Schuller
# TeamChallenger
# 22. November 2017
# Part-Klasse

class Part
  include Enumerable
  attr_accessor :part, :parts
  def initialize(part, parts={}, mass = nil)
    @part = part
    @parts = parts
    @mass = mass
  end
  
  if (@mass == nil)
    @mass = 0.0
  end
  if (@part == nil)
    @part = ""
  end 
  
  def to_s(indent = 0)
      part_s = @part.to_s
      sub_indent = indent + part_s.length
    part_s + @parts.map { |parts| " ~ " + parts.to_s(sub_indent + 3)}.join("\n" + ' ' * sub_indent)
  end
  
  def add_part (name, gewicht)
    @part[name] = gewicht
  
  def add_parts (parent, name, gewicht)
    @parts[parent, name] = gewicht
end

def each
  @parts.each {|part| puts part}
end

def replace_new_part(new)
  @parts.delete(@parts[x])
  new.parent = self
  @parts.push(new)
  return self
end

def empty?
  return @parts.empty?
end

def == (part)
  if(self.name == part.name && self.mass == part.mass && @parts == part.all_parts)
    return true
  end
  return false
end

def remove_part(part)
  @part.delete(part)
end

def top(part)
  if @part == nil
    return @parts
  else
    return @part
  end
end 
end
end 



# Skript
AUTO = Part.new("Auto", %w{ Karosserie Reifen Sitze Spiegel Motor}.map {|str| Part.new(str)})
  puts "Darstellung der Stückliste Auto"
  puts AUTO
  puts

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

# Einzelteil hinzufügen.
@mass.push([1.11, 2.89])
@parts.push(navigation = {"Technik" => @mass[5][0], "Kabel" => @mass[5][1]})

puts "--> Navigation:"
@parts[5].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

# Einzelteil austauschen.
# Einzelteil löschen.
# Anzahl an Einzelteilen.
# Gesamtmasse
# Oberstes Teil




