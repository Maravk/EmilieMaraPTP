# Author: Mara von Kroge, Emilie Schuller
# 22. Novemer 2017
# TeamChallenger
# Testklasse zu emilie_tree_part

# Dateien werden angefordert.
require 'test/unit'
require_relative "emilie_tree_part"

# Neue Testklasse
class TestEmilieTreePart < Test::Unit::TestCase
  
  # Set-Up wird erstellt.
  def setup()
  @auto=Part.new("Auto", %w{ Karosserie Motor})
  @mass=[[100, 170], [40, 22]]
@parts=[karosserie = {"Metall" => @mass[0][0], "Kotflügel" => @mass[0][1]}, motor = {"Schläuche" => @mass[1][0], "Kolben" => @mass[1][1]}]
end

def test_teile_hinzufuegen
  @mass.push([1.11, 2.89])
  @parts.push(navigation = {"Technik" => @mass[2][0], "Kabel" => @mass[2][1]})
    assert_equal(1.11, @mass[2][0], "Fehler!")
    assert_equal(navigation, @parts[2], "Fehler!")
end

def test_teil_austauschen
  @parts.delete_at(0)
  @mass.push([1.4, 0.2])
  @parts.push(fernseher = {"Gehäuse" => @mass[2][0], "Kabel" => @mass[2][1]})
    assert_equal(0.2, @mass[2][1], "Fehler!")
    assert_equal(nil, @parts[2], "Fehler!")
end 

def test_empty?
  assert_equal(false, @parts.empty?, "Fehler!")
end 

def test_gesamtmasse
  mass0 = @mass[0].inject(0,:+)
  mass1 = mass0 + @mass[1].inject(0,:+)
  assert_equal(332, mass1, "Fehler!")
end

def test_top
assert_equal(["Metall", 100], @parts[0].first.each {|name, gewicht| puts "#{name}"}, "Fehler!")
end 

def test_vergleich
  assert_not_equal(true, @parts[0] == @parts[1], "Fehler!")
end
end