# Author: Mara von Kroge, Emilie Schuler, 21. November 2017
# TeamChallenger
# Testfälle zu Part

require 'test/unit'
require_relative 'part_final'

class TestPart < Test::Unit::TestCase
  
  # Setup wird initialisiert.
  def setup()
    @parts_auto = Part.new("Auto",0,nil)
    
    @parts_auto.add_part("Reifen", 45)
    @parts_auto.add_part("Motor", 850)
    @parts_auto.add_part("Reifen", 45)
    @parts_auto.add_part("Sitze", 20)
    
    @parts_auto_total_weight = 1830.0
    @parts_auto_size_parts = 4
  end
  
  # Initialize-Test
  def test_initialize
    new_auto = Part.new("Auto", 0, nil)
    assert_equal("Auto", new_auto.name, "Fehler")
    assert_equal(0, new_auto.mass, "Fehler!")
    assert_equal(nil, new_auto.parent, "Fehler!")
  end
  
  
  # Test - Einzelteil hinzufügen.
  def test_einzelteil_hinzufuegen()
    assert_equal(45, @parts_auto.add_part("Sitze", 45), "Fehler!")
    assert_equal(3, @parts_auto.size_parts, "Fehler!")
  end
  
  
  # Test - Gesamtgewicht
  def test_total_weight()
    assert_equal(915.0, @parts_auto.total_weight(), "Fehler!")
end


  # Test - Empty?
def test_empty
   auto_new = Part.new("Rückspiegel", 1)
   assert_equal(false, @parts_auto.empty?, "Fehler!")
end


  # Test - Vergleich
def test_vergleich
  new_auto = Part.new("Stoßstange", 100)
  new_auto1 = Part.new("Lenkrad", 10)
  assert_not_equal(true,(new_auto)==(new_auto1) , "Fehler!")
end


  # Test - Einzelteil entfernen. 
def remove_einzelteil
  assert_equal(850, @parts_auto.remove_part("Motor", 850), "Fehler!")
  assert_equal(2, @parts_auto.size_parts(), "Fehler!")
end
end

