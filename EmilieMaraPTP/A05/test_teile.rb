# Author: Emilie Schuller, Mara von Kroge, 17. November 2017
# TeamChallenger
# Testklasse zu Teil

# Dateien werden angefordert.
require 'test/unit'
require_relative 'aufgabe_1'

class TestTeile < Test::Unit::TestCase
  
  def setup()
    @ganzes = Hash.new
    @teil = Hash.new
    @teile = Hash.new
    @masse = Array.new
  end
  
  
  # Test - Initialize
  def test_initialize
    assert_not_equal(nil, @ganzes, "Fehler!")
  end
  
  # Test - Teil zu Teil hinzufügen.
  def test_teil_hinzufuegen
    @teil["Software"] = "Windows"
    assert_equal(["Software", "Windows"], @teil.first, "Fehler!") 
  end
  
  # Test - Teile zu Teile hinzufügen.
  def test_teile_hinzufuegen
    @teile["Kühler"] = 0.7
    assert_equal(["Kühler", 0.7] , @teile.first, "Fehler!")
  end
  
  # Test - Teil entfernen.
  def test_teil_entfernen
    @teil.delete("Programmierer" => "Mara")
    assert_equal(nil, @teil.first, "Fehler!")
  end
  
  # Test - Ganzes hinzufügen.
  def test_ganzes_hinzufuegen
    @ganzes["Computer"] = "Hardware"
    assert_equal(["Computer", "Hardware"], @ganzes.first, "Fehler!")
  end
  
  # Test - Ganzes hinzufügen.
  def test_ganzes_hinzufuegen
    @ganzes["Tastatur"] = "Kabel"
    assert_equal(["Tastatur", "Kabel"], @ganzes.first, "Fehler!")
  end
  
  # Test - Ganzes austauschen.
  def test_ganzes_austauschen
    @ganzes.replace({"Maus" => "Kabel"})
      assert_equal(["Maus", "Kabel"], @ganzes.first, "Fehler!")
  end
  
  # Test - Ganzes entfernen.
  def test_ganzes_entfernen
    @ganzes.delete("Tastatur")
    assert_equal(nil, @ganzes.first, "Fehler!")
  end
  
  # Test - Erstes Teil von Teil ausgeben.
  def test_erstes_teil_von_teil
    @teil["Hardware"] = ["Prozessor", "Grafikkarte", "Mainboard"]
    assert_equal(["Hardware", ["Prozessor", "Grafikkarte", "Mainboard"]], @teil.first, "Fehler!")
  end
  
  # Test - Gesamtmasse
  def test_gesamtmasse
    @masse << [0.01, 1.3, 1, 0.7, 1.5, 1.0].reduce(:+)
    assert_equal(5.51, @masse.reduce(:+), "Fehler!")
  end
end 