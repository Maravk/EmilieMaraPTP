# Author:: Emilie Sarina Schuller, 23. Oktober 2017
# Testen - Rechteck

require 'test/unit'
require_relative 'rechteck'

  class TestRechteck < Test::Unit::TestCase
    
    
   def setup()
     @Rechteck=Rechteck.new
   end
  
   
  def test_farbe_aendern
    
    @Rechteck.farbe_aendern('gruen')
    assert_equal=('green', @Rechteck.farbe,'Dies ist die falsche Farbe!')
    
    @Rechteck.farbe_aendern('rot')
    assert_equal=('red', @Rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @Rechteck.farbe_aendern('gelb')
    assert_equal=('yellow', @Rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @Rechteck.farbe_aendern('weiss')
    assert_equal=('white', @Rechteck.farbe, 'Dies ist die falsche Farbe!')
    
    @Rechteck.farbe_aendern('schwarz')
    assert_equal=('black', @Rechteck.farbe, 'Dies ist die falsche Farbe!')
    
  
  
    def test_nach_unten_bewegen
        @Rechteck.nach_unten_bewegen()
        assert_equal('0,10', @Rechteck.bewegen_um_punkt(Punkt.new(0,10)), 'Dieser Punkt ist nicht richtig')
    end 
 
    
    
    def test_horzontal_bewegen
      @Rechteck.horzontal_bewegen(anzahl)
      assert_equal('anzahl,0', @Rechteck.bewegen_um_punkt(Punkt.new(anzahl,0)), 'Dieser Punkt ist nicht richtig!')
    end 
   
    
    def test_vertikal_bewegen
     @Rechteck.vertiakl_bewegen(anzahl)
     assert_equal('0,anzahl', @Rechteck.bewegen_um_punkt(Punkt.new(0,anzahl)), 'Dieser Punkt ist nicht richtig!')
    end
  end
  
end