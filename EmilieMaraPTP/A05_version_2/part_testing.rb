# Author: Emilie Schuller, Mara von Kroge, 14. November 2017
# TeamChallenger
# Tests für Klasse Part

require "test/unit"
require_relative "part.rb"

class TestPart < Test::Unit::TestCase
  
  def setup()
    @auto = Part.new("Auto", 1380)
    
    @auto_reifen = Part.new("Reifen", 120, @auto)
    @auto.add_part(@auto_reifen)
    @auto_bremse = Part.new("Bremsen", 40, @auto)
    @auto.add_part(@auto_bremse)
    @auto_motor = Part.new("Motor", 480)
    @auto.add_part(@auto_motor)
    @auto_zylinder = Part.new("Zylinder", 18, @auto_motor)
    @auto_motor.add_part(@auto_zylinder)
    @ferrari = Part.new("Ferrari", 2200)
        
  end
  
  def test_new()
    new_part = Part.new("PART",100)
    assert(new_part)
    assert_equal("PART",new_part.name())
    assert_equal(100.0,new_part.mass())
    assert_equal(nil, new_part.parent())
  end
  
  # Test - Hinzufügen eines Teils
  def test_add_part()
    new_part = Part.new("Car Seats",100)
    @auto.add_part(new_part)
    assert_equal(5,@auto.total_parts_amount())
    assert_raise TypeError do @auto.add_part(nil)
    end
  end
  
  # Test - Instanzvariable name
  def test_name()
    assert_equal("Auto", @auto.name)
  end
 
  # Test - Instanzvariable mass
  def mass_of_this()
    assert_equal(1380, @auto.mass_of_this())
  end 
  
 # Test - Geamtgewicht
  def test_total_weight()
    assert_equal(@auto.mass_of_all, 2038)
  end
  
  # Test - Parent
  def test_parent()
    @auto.all_parts.each { |part|
      assert_equal(part.parent, @auto)
    }
  end
  
  def test_set_parent
    assert_equal(@ferrari, @auto.set_parent(@ferrari))
  end
  
  # Test - Empty
  def test_empty?()
    assert_equal(true, @auto_reifen.empty?())
  end
  
  # Test - oberstes Teil
  def test_top()
    assert_equal(@auto_zylinder, @auto.top)
  end
  

  # Die Anzahl der Teile reduziert sich um 1
  def test_remove()
    assert_equal(4,@auto.total_parts_amount())
    @auto.remove(@auto_bremse)
    assert_equal(3,@auto.total_parts_amount)
    assert_raise TypeError do @auto.remove(nil)
   end
  end

  
  # Reifen werden durch leichtere Ersetzt
  def test_replace()
    
    previous_weight = @auto.mass_of_all()
    @auto_leichte_reifen = Part.new("leichte Reifen",90, @auto)
    new_weight = previous_weight - (@auto_reifen.mass_of_all - @auto_leichte_reifen.mass_of_all)
    
    @auto.replace(@auto_reifen, @auto_leichte_reifen)
    
    assert_equal(new_weight, @auto.mass_of_all)
    assert_raise TypeError do @auto.replace(nil, nil)
    end
  end
  
  # Test - Equal
  def test_eql
    assert_equal(true, @auto.eql?(@auto))
  end
  
  # Test - Gleichgleich
  def test_gleichheit
    assert_equal(false, @auto_zylinder == @auto_bremse)
  end  
  
  # Test - Each
  def test_each
    assert_not_equal(@auto, @auto.each)
  end
end