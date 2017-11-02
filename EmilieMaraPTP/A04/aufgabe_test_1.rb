# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Queue

require 'test/unit'
require 'A04\aufgabe_1'

class TestQueue < Test::Unit::TestCase

def setup()
  queue=Queue.new
end

def test_hinzufuegen_am_ende
  assert_equal("Cookie Dough", @queue << eis, "Diese Eissorte ist falsch!")
  assert_equal("Karamel Sutra", @queue << eis, "Diese Eissorte ist falsch!")
  assert_equal("What-a-lotta Chocolate", @queue << eis, "Diese Eissorte ist falsch!")
end

def test_entfernen_am_anfang
  assert_equal("Cookie Dough", @queue.shift, "Diese Eissorte ist falsch!")
end

def test_erstes_element_ausgeben
  assert_equal("Karamel Sutra", @queue.first, "Diese Eissorte ist falsch!")
end


end