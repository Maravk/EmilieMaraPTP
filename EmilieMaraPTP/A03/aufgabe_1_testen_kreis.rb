#Author: Emilie Schuller, 22. Oktober 2017
# Testen

require 'test/unit'
require_relative 'kreis'

class TestKreis < Test::Unit::TestCase

  
    def setup()
      @Kreis=Kreis.new
    end
    
    
  def test_farbe_aendern
    
    @Kreis.farbe_aendern('gruen')
    assert_equal('green', @Kreis.farbe(), 'Diese Farbe ist nicht richtig!')
    
    @Kreis.farbe_aendern('rot')
      assert_equal('red', @Kreis.farbe(), 'Diese Farbe ist nicht richtig!')
      
    @Kreis.farbe_aendern('gelb')
      assert_equal('yellow', @Kreis.farbe(), 'Diese Farbe ist nicht richtig!')
      
    @Kreis.farbe_aendern('weiss')
    assert_equal('white', @Kreis.farbe(), 'Diese Farbe ist nicht richtig!')
    
    @Kreis.farbe_aendern('schwarz')
    assert_equal('black', @Kreis.farbe(), 'Diese Farbe ist nicht richtig!')
  end 
  
  
    
    def test_nach_unten_bewegen
        @Kreis.nach_unten_bewegen()
        assert_equal('0,10', @Kreis.bewegen_um_punkt(Punkt.new(0,10)), 'Dieser Punkt ist nicht richtig')
    end 
 
    
    
    def test_horzontal_bewegen
      @Kreis.horzontal_bewegen(anzahl)
      assert_equal('anzahl,0', @Kreis.bewegen_um_punkt(Punkt.new(anzahl,0)), 'Dieser Punkt ist nicht richtig!')
    end 
   
    
    def test_vertikal_bewegen
     @Kreis.vertiakl_bewegen(anzahl)
     assert_equal('0,anzahl', @Kreis.bewegen_um_punkt(Punkt.new(0,anzahl)), 'Dieser Punkt ist nicht richtig!')
    end
    
end 
