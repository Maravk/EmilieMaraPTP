# Author:: Emilie Schuller, Ralf Hermann, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Queue

# Dateien werden angefordert.
require 'test/unit'
require_relative 'aufgabe_1'

# Testklasse wird erstellt.
class TestQueue < Test::Unit::TestCase

  # Neues Array wird erstellt.
def setup()
  @queue=Queue.new
end

# Test - Initialize 
def test_initialize
  assert_not_equal(nil, @queue, "Dies ist kein leeres Array!")
end

# Test - Element hinzufügen
def test_enqueue
  @queue.enqueue("Cookie Dough")
  assert_equal("Cookie Dough", @queue.peek, "Diese Eissorte ist falsch!")
end

# Test - Länge
def test_size
  assert_equal(0, @queue.size, "Die Länge ist falsch!")
end

# Test - Element entfernen
def test_dequeue
  assert_equal(@queue, @queue.dequeue, "Diese Eissorte ist falsch!")
end

# Test - Erstes Element ausgeben
def test_peek
  assert_equal(nil, @queue.peek, "Diese Eissorte ist falsch!")
end

# Test - Empty
def test_empty
  assert_equal(true, @queue.empty?, "Fehler!")
end
end