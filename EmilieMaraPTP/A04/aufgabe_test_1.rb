# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Queue

# Dateien werden angefordert.
require 'test/unit'
require_relative 'aufgabe_1'

# Testklasse wird erstellt.
class TestQueue < Test::Unit::TestCase

  # Neues Array wird erstellt.
def setup()
  @queue=Queue.new
  @queue=[]
end

# Test - Initialize 
def test_initialize
  assert_equal([], @queue, "Dies ist kein leeres Array!")
end

# Test - Element hinzufuegen
def test_enqueue
  assert_equal(["Cookie Dough"], @queue.push("Cookie Dough"), "Diese Eissorte ist falsch!")
end

# Test - Laenge
def test_size
  assert_equal(0, @queue.size, "Die Länge ist falsch!")
end

# Test - Element entfernen
def test_dequeue
  assert_equal(nil, @queue.shift, "Diese Eissorte ist falsch!")
end

# Test - Erstes Element ausgeben
def test_peek
  assert_equal(nil, @queue.first, "Diese Eissorte ist falsch!")
end
end