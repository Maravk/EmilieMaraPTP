# Author: Mara von Kroge, Emilie Schuler, 21. November 2017
# TeamChallenger
# Testfälle zu Part

require 'test/unit'
require_relative 'Part'

class TestPart < Test::Unit::TestCase
  
  # Setup wird initialisiert
  def setup()
    @parts_auto = Part.new("Auto",0,nil)
    @parts_auto_reifen = Part.new("Reifen",45,"Auto")
    @parts_auto_motor = Part.new("Motor",850,"Auto")
    
    @parts_auto.add_part(@parts_auto_reifen, )
    @parts_auto.add_part(@parts_auto_motor)
    @parts_auto.add_part(@parts_auto_reifen)
    @parts_auto.add_part(@parts_auto_sitze)
    
    @parts_auto_total_weight = 1830.0
    @parts_auto_size_parts = 6
  end
  
  # Initialize-Test
  def test_initialize
    new_auto = Part.new("Auto", 0, nil)
    assert_equal("Auto", new_auto.name, "Fehler")
    assert_equal(0, new_auto.mass, "Fehler!")
    assert_equal(nil, new_auto.parent, "Fehler!")
  end
  
  # Test - Einzelteil hinzufügen
  def test_teil_hinzufuegen()
    new_auto = Auto.new("Sitze", 45)
    @parts_auto.add(new_auto)
    assert_equal(new_auto.pranet(), @parts_auto, "Fehler!")
    assert_equal(4, @parts_auto.size, "Fehler!")
  end
  
  # Test - Gesamtgewicht
  def test_total_weight()
    new_auto = Auto.new()
end
end

