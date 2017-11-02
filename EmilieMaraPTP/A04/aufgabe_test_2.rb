# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

require 'test/unit'
require 'A04\aufgabe_2'

class TestStack < Test::Unit::TestCase

def setup()
  stack=Stack.new
  
end

def test_hinzufuegen_am_ende
  @karte="Dame"
  assert_equal("Dame", @stack << karte, "Diese Karte ist falsch!")
  @karte="König"
  assert_equal("König", @stack << karte, "Diese Karte ist falsch!")
  @karte="Ass"
  assert_equal("Ass", @stack << karte, "Diese Karte ist falsch!")
end

def test_entfernen_am_ende
  assert_equal("Ass", @stack.pop, "Diese Karte ist falsch!")
end

def test_letztes_element_ausgeben
  assert_equal("König", @stack.last, "Diese Karte ist falsch!")
end


end