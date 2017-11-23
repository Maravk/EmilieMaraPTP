# Author: Mara von Kroge, Emilie Schuller
# TeamChallenger
# 23. November 2017
# Script zu emilie_tree_part

require_relative "emilie_tree_part"

HAUS=Part.new("Haus", %w{Wohnzimmer Küche Badezimmer Schlafzimmer}.map {|str| Part.new(str)})
  puts "Darstellung der Stückliste Haus"
  puts HAUS
  
  @mass = [[100, 80, 130, 3], [239, 160, 300], [350, 200, 370, 100], [400, 120, 322]]
@parts = [wohnzimmmer = {"Sofa" => @mass[0][0], "Fernseher" => @mass[0][1], "Tisch" => @mass[0][2], "PlayStation" => @mass[0][3]},
kueche = {"Kühlschrank" => @mass[1][0], "Esstisch" => @mass[1][1], "Kochzeile" => @mass[1][2]}, badezimmer = {"Dusche" => @mass[2][0],
"Waschbecken" => @mass[2][1], "Badewanne" => @mass[2][2], "WC" => @mass[2][2]}, schlafzimmer = {"Bett" => @mass[3][0], "Fernseher" => @mass[3][1],
"Kleiderschrank" => @mass[3][2]}]

puts "Einzelteile von Haus"
puts "--> Wohnzimmer:"
@parts[0].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Küche:"
@parts[1].each do |name, gewicht|
    puts "             Beschreibung: #{name}"
    puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Badezimmer:"
@parts[2].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end

puts "--> Schlafzimmer:"
@parts[3].each do |name, gewicht|
  puts "             Beschreibung: #{name}"
  puts "             Gewicht     : #{gewicht} Kilogramm"
end
puts ''