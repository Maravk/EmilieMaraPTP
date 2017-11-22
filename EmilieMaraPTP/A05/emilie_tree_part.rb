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
  
@parts = [karosserie = {"Metall" => 100, "Kotflügel" => 170, "Scharniere" => 20, "Türen" => 200}, reifen = {"Gummi" => 20, "Felgen" => 10}, sitze = {"Leder" => 45}, spiegel = {"Glas" => 2, "Halterung" => 0.5}, motor = {"Schläuche" => 20, "Kolben" => 2, "Aggregatetrieb" => 35, "Kurbelwelle" => 5}]
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