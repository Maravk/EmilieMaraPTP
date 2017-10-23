#Author: Emilie Schuller, 22. Oktober 2017
# Testen

require 'test/unit'
require_relative 'dreieck'

class TestDreieck < Test::Unit::TestCase

  
    def setup()
      @Dreieck=Dreieck.new
    end
    
    
  def test_farbe_aendern
    @Dreieck.farbe_aendern('gruen')
     assert_equal('green',@Dreieck.farbe(),'Diese Farbe ist nicht richtig!')
     
     @Dreieck.farbe_aendern('rot')
       assert_equal('red',@Dreieck.farbe(),'Diese Farbe ist nicht richtig!')
       
     @KDreieck.farbe_aendern('gelb')
       assert_equal('yellow',@Dreieck.farbe(),'Diese Farbe ist nicht richtig!')
       
     @Dreieck.farbe_aendern('weiss')
     assert_equal('white',@Dreieck.farbe(),'Diese Farbe ist nicht richtig!')
     
     @Dreieck.farbe_aendern('schwarz')
     assert_equal('black',@Dreieck.farbe(),'Diese Farbe ist nicht richtig!')
   end 
   
   
   def test_nach_unten_bewegen
     @Dreieck.nach_unten_bewegen()
     assert_equal('0,10', @Dreieck.bewegen_um_punkt(Punkt.new(0,10)), 'Dieser Punkt ist nicht richtig!') 
   end
   
   
   def test_vertiakl_bewegen
     @Dreieck.vertikal_bewegen(anzahl)
     assert_equal('0, anzahl', @Dreieck.bewegen_um_punkt(Punkt.new(0,anzahl)), 'Dieser Punkt ist nicht richtig!')
   end
   
   
   def test_horizontal_bewegen
     @Dreieck.horizontal_bewegen(anzahl)
     assert_equal('anzahl, 0', @Dreieck.bewegen_um_punkt(Punkt.new(anzahl, 0)), 'Dieser Punkt ist nicht richtig!')
   end
   
end 
  