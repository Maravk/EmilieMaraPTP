# Author: Mara von Kroge, Emilie Schuller, 22. Oktober 2017
# Testen - Kreis


# Die Testklasse sowie der zum Testen benötigte Sourcode werden angefordert.
require 'test/unit'
require_relative 'Kreis'

# Testklasse wird erstellt.
class TestKreis < Test::Unit::TestCase

  # Neues Obejekt der Klasse wird erstellt.
    def setup()
      @kreis=Kreis.new
      @mittelpunkt=Punkt.new(00,00)
    end
    
    
    # Initialize-Test ('Was rauskommen soll, 'Methode', 'Fehlermeldung')
    def test_initialize
      assert_equal(false,@kreis.sichtbar?(),'Die Sichtbarkeit ist nicht richtig!')
      assert_equal('red',@kreis.farbe(), 'Die Farbe ist nicht richtig!')
      assert_equal(15,@kreis.radius(), 'Der Radius nicht richtig!')
    end
    
    
    # Farben ändern Test
  def test_farbe_aendern
    
    @kreis.farbe_aendern('gruen')
    assert_equal(:green, @kreis.farbe(), 'Diese Farbe ist nicht richtig!')
    
    @kreis.farbe_aendern('rot')
      assert_equal(:red, @kreis.farbe(), 'Diese Farbe ist nicht richtig!')
      
    @kreis.farbe_aendern('gelb')
      assert_equal(:yellow, @kreis.farbe(), 'Diese Farbe ist nicht richtig!')
      
    @kreis.farbe_aendern('weiss')
    assert_equal(:white, @kreis.farbe(), 'Diese Farbe ist nicht richtig!')
    
    @kreis.farbe_aendern('schwarz')
    assert_equal(:black, @kreis.farbe(), 'Diese Farbe ist nicht richtig!')
  end 
  
  
    # Test - Nach unten bewegen
    def test_nach_unten_bewegen
        @mittelpunkt=Punkt.new(20,70)
        assert_equal(20, @mittelpunkt.x, 'Dieser x-Punkt ist falsch')
        assert_equal(70, @mittelpunkt.y, 'Dieser y-Punkt ist falsch!')
    end 
    
    # Test - Horizontal bewegen
    def test_horizontal_bewegen
      @mittelpunkt=Punkt.new(20,00)
      assert_equal(20, @mittelpunkt.x, 'Dieser x-Punkt ist falsch!')
      assert_equal(00, @mittelpunkt.y, 'Dieser y-Punkt ist falsch!')
     
    end 
    # Test - Vertikal bewegen
    def test_vertikal_bewegen
      @mittelpunkt=Punkt.new(00,60)
     assert_equal(00, @mittelpunkt.x, 'Dieser x-Punkt ist falsch!')
     assert_equal(60, @mittelpunkt.y, 'Dieser y-Punkt ist falsch!')
    end
    end 