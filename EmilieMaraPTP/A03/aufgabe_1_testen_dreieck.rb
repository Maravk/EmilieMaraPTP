#Author: Emilie Schuller, Mara von Kroge, 22. Oktober 2017
# Testen - Dreieck


# Testklasse und der zum Testen benötigte Sourcecode wird angefordert.
require 'test/unit'
require_relative 'Dreieck'

# Testklasse wird erstellt.
class TestDreieck < Test::Unit::TestCase

  
  # Neues Objekt der Klasse wird erstellt. 
    def setup()
      @dreieck=Dreieck.new
    end
    
    
    # Initialize-Test ('Was rauskommen soll', 'Methode', 'Fehlermeldung')
    def test_initialize
      assert_equal(false, @dreieck.sichtbar?, 'Die Sichtbarkeit ist nicht richtig!')
      assert_equal('green', @dreieck.farbe, 'Die Farbe ist nicht richtig!')
      assert_equal(30, @dreieck.hoehe, 'Die Höhe ist nicht richtig!')
      assert_equal(40, @dreieck.breite, 'Die Breite ist nicht richtig!')
    end
    
    
    # Test - Farbe ändern
  def test_farbe_aendern
    @dreieck.farbe_aendern('gruen')
     assert_equal(:green,@dreieck.farbe(),'Diese Farbe ist nicht richtig!')
     
     @dreieck.farbe_aendern('rot')
       assert_equal(:red,@dreieck.farbe(),'Diese Farbe ist nicht richtig!')
       
     @dreieck.farbe_aendern('gelb')
       assert_equal(:yellow,@dreieck.farbe(),'Diese Farbe ist nicht richtig!')
       
     @dreieck.farbe_aendern('weiss')
     assert_equal(:white,@dreieck.farbe(),'Diese Farbe ist nicht richtig!')
     
     @dreieck.farbe_aendern('schwarz')
     assert_equal(:black,@dreieck.farbe(),'Diese Farbe ist nicht richtig!')
   end 
   

   # Test - Nach unten bewegen
   def test_nach_unten_bewegen(x,y)
     @dreieck.nach_unten_bewegen
     assert_equal(0, @spitze.x, 'Dieser x-Punkt ist falsch!') 
     assert_equal(25, @spitze.y, 'Dieser y-Punkt ist falsch!')
   end

   
   # Test - Vertikal bewegen
   def test_vertikal_bewegen(x,y)
     @dreieck.vertikal_bewegen
     assert_equal(0, @spitze.x, 'Dieser x-Punkt ist nicht richtig!')
     assert_equal(15, @sptze.y, 'Dieser y-Punkt ist falsch!')
   end
   
   
   
   # Test - Horizontal bewegen
   def test_horizontal_bewegen(x,y)
     @dreieck.horizontal_bewegen
     assert_equal(50, @spitze.x, 'Dieser x-Punkt ist nicht richtig!')
     assert_equal(0, @spitze.y, 'Dieser y-Punkt ist falsch!')   
   end
   
end   
  