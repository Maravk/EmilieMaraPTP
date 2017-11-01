# Author:: Emilie Sarina Schuller, Mara von Kroge, 23. Oktober 2017
# Testen - Rechteck


# Die Testklasse sowie der zum Testen benötigte Sourcecode werden angefordert.
require 'test/unit'
require_relative 'Rechteck'


# Neue Testklasse wird erstellt.
  class TestRechteck < Test::Unit::TestCase
    
    
    # Neues Objekt der Testklasse wird erstellt.
   def setup
     @rechteck=Rechteck.new
     @obere_linke_ecke=Punkt.new(00,00)
   end
  
   
   # Initialize-Test
   # ('Was rauskommen soll', 'Methode', 'Fehlermeldung')
   def test_initalize
     assert_equal(:blue, @rechteck.farbe, 'Die Farbe ist nicht richtig!')
     assert_equal(false, @rechteck.sichtbar?, 'Die Sichtbarkeit ist falsch!')
     assert_equal(30, @rechteck.breite, 'Die Breite ist falsch!')
     assert_equal(30, @rechteck.hoehe, 'Die Höhe ist falsch!')
   end
   
   # Test - Farbe ändern
  def test_farbe_aendern
    
    @rechteck.farbe_aendern('gruen')
    assert_equal(:green, @rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @rechteck.farbe_aendern('rot')
    assert_equal(:red, @rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @rechteck.farbe_aendern('blau')
    assert_equal(:blue, @rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @rechteck.farbe_aendern('gelb')
    assert_equal(:yellow, @rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @rechteck.farbe_aendern('weiss')
    assert_equal(:white, @rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @rechteck.farbe_aendern('schwarz')
    assert_equal(:black, @rechteck.farbe, 'Dies ist die falsche Farbe!')
  end  
  
  # Test - Nach unten bewegen
    def test_nach_unten_bewegen
        @obere_linke_ecke=Punkt.new(20,70)
        assert_equal(20, @obere_linke_ecke.x, 'Dieser x-Punkt ist falsch!')
        assert_equal(70, @obere_linke_ecke.y, 'Dieser y-Punkt ist falsch!')
    end 
 
    
    # Test - Horizontal bewegen
    def test_horizontal_bewegen
      @obere_linke_ecke=Punkt.new(20,00)
      assert_equal(20, @obere_linke_ecke.x, 'Dieser x-Punkt ist falsch!')
      assert_equal(0, @obere_linke_ecke.y, 'Dieser y-Punkt ist falsch!')
    end 
   
    # Test - Vertikal bewegen
    def test_vertikal_bewegen
     @obere_linke_ecke=Punkt.new(00,60)
     assert_equal(0, @obere_linke_ecke.x,'Dieser x-Punkt ist falsch!')
     assert_equal(60, @obere_linke_ecke.y, 'Dieser y-Punkt ist falsch!')
    end
  end
