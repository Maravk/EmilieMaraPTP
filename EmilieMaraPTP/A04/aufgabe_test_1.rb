# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Queue

require 'test/unit'
require_relative 'aufgabe_1'

class TestQueue < Test::Unit::TestCase

def setup()
  @queue=Queue.new
end

def test_hinzufuegen_am_ende
  @queue.hinzufuegen_am_ende("Cookie Dough")
  assert_equal(:CookieDough, @queue.eis, "Diese Eissorte ist falsch!")
  
  @queue.hinzufuegen_am_ende("Karamel Sutra")
  assert_equal(:KaramelSutra, @queue.eis, "Diese Eissorte ist falsch!")
 
  @queue.hinzufuegen_am_ende("What-a-lotta Chocolate")
  assert_equal(:WhatALottaChocolate, @queue.eis, "Diese Eissorte ist falsch!")
end


def test_entfernen_am_anfang
  assert_equal(nil, @queue.entfernen_am_anfang, "Diese Eissorte ist falsch!")
end


def test_erstes_element_ausgeben
  assert_equal(nil, @queue.erstes_element_ausgeben, "Diese Eissorte ist falsch!")
end

end