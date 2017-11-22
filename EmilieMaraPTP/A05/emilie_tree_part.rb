# Author: Mara von Kroge, Emilie Schuller
# TeamChallenger
# 22. November 2017
# Part-Klasse

class Part
  include Enumerable
  attr_accessor :part, :parts
  def initialize(part, parts={})
    @part = part
    @parts = parts
    @mass = mass
  end
  
  
  def to_s(indent = 0)
      part_s = @part.to_s
      sub_indent = indent + part_s.length
    part_s + @parts.map { |parts| " ~ " + parts.to_s(sub_indent + 3)}.join("\n" + ' ' * sub_indent)
  end
  
  def add_part
end

AUTO = Part.new("Auto", %w{ Karosserie Reifen Sitze Spiegel Motor}.map {|str| Part.new(str)})
  puts "Darstellung der Stückliste Auto"
  puts AUTO
  puts
  
PARTS = [karosserie = {"Metall" => 100, "Kotflügel" => 170, "Scharniere" => 20, "Türen" => 200}, reifen = {"Gummi" => 20, "Felgen" => 10}, sitze = {"Leder" => 45}, spiegel = {"Glas" => 2, "Halterung" => 0.5}, motor = {"Schläuche" => 20, "Kolben" => 2, "Aggregatetrieb" => 35, "Kurbelwelle" => 5}]
  
  puts "Einzelteile von Auto"
  puts "--> Karosserie:"
PARTS[0].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Reifen:"
PARTS[1].each do |name, gewicht|
    puts "             Beschreibung: #{name}"
    puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Sitze:"
PARTS[2].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Spiegel:"
PARTS[3].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Motor:"
PARTS[4].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

