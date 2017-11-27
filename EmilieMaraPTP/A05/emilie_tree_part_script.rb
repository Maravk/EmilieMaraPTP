# Author: Mara von Kroge, Emilie Schuller
# TeamChallenger
# 23. November 2017
# Script zu emilie_tree_part

require_relative "emilie_tree_part"

# Skript
auto = Part.new("Auto", %w{ Karosserie Reifen Sitze Spiegel Motor}.map {|str| Part.new(str)})
  puts "Darstellung der Stückliste Auto"
  puts auto
    

@mass = [[100, 170, 20, 200], [20, 10], [45], [2, 0.5], [20, 2, 35, 5]] 
@parts = [karosserie = {"Metall" => @mass[0][0], "Kotflügel" => @mass[0][1], "Scharniere" => @mass[0][2], "Türen" => @mass[0][3]}, reifen = {"Gummi" => @mass[1][0], "Felgen" => @mass[1][1]}, sitze = {"Leder" => @mass[2][0]}, spiegel = {"Glas" => @mass[3][0], "Halterung" => @mass[3][1]}, motor = {"Schläuche" => @mass[4][0], "Kolben" => @mass[4][1], "Aggregatetrieb" => @mass[4][2], "Kurbelwelle" => @mass[4][3]}]
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

#puts "Das Einzelteil Teppich wurde zum Teil Wohnzimmer hinzugefügt:"
#puts HAUS.add_parts(0,4, "Teppich", 20)

puts "Das Teil Wohnzimmer wird nun mit Arbeitszimmer ausgetauscht:"
#puts HAUS.replace_new_part(0, [200, 300], arbeitszimmer => {"PC" => @mass[0][0], "Sessel" => @mass[0][1]})

puts "Die Gesamtmasse aller Einzelteile und Teile summiert sind #{HAUS.mass} Kilogramm."

puts "Sind Küche und Schlafzimmer identisch?"
puts @parts[1] == @parts[3]
puts''

puts "Das oberste Einzelteil des Teils Wohnzimmer ist:"
puts HAUS.top(0,0)
puts ''

puts "Ist das gesamte Teil Haus leer?"
puts HAUS.empty?