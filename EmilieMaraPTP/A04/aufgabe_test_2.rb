# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

require 'test/unit'
require 'A04\aufgabe_2'

class TestStack < Test::Unit::TestCase

def setup()
  stack=Stack.new
  
end

def test_hinzufuegen_am_ende
  assert_equal("Dame", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
  assert_equal("König", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
  assert_equal("Ass", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
end

def test_entfernen_am_ende
  assert_equal("Ass", @stack.entfernen_am_ende, "Diese Karte ist falsch!")
end

def test_letztes_element_ausgeben
  assert_equal("König", @stack.letztes_element_ausgeben, "Diese Karte ist falsch!")
end


end