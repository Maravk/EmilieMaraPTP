# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

require 'test/unit'
require_relative 'aufgabe_2'

class TestStack < Test::Unit::TestCase

def setup()
  @stack=Stack.new
  
end

def test_hinzufuegen_am_ende
  @stack.hinzufuegen_am_ende("Dame")
  assert_equal(:Dame, @stack, "Diese Karte ist falsch!")
#  @stack=Stack.new("König")
#  assert_equal("König", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
#  @stack=Stack.new("Ass")
#  assert_equal("Ass", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
end

def test_entfernen_am_ende
  assert_equal(nil, @stack.entfernen_am_ende, "Diese Karte ist falsch!")
end

def test_letztes_element_ausgeben
  assert_equal(nil, @stack.letztes_element_ausgeben, "Diese Karte ist falsch!")
end

end