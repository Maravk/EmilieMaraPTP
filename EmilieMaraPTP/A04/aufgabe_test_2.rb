# Author:: Emilie Schuller, Ralf Hermann, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

# Dateien werden angefordert.
require 'test/unit'
require_relative 'aufgabe_2'

# Testklasse wird erstellt.
class TestStack < Test::Unit::TestCase

  # Neues Array wird erstellt.
def setup()
  @stack=Stack.new
end

# Test - Initialize
def test_initialize
  assert_not_equal(nil, @stack, "Dies ist kein leeres Array!")
end

# Test - Neues Element hinzufügen
def test_push
  @stack.push("Dame")
  assert_equal("Dame", @stack.peek, "Diese Karte ist falsch!")
end

# Test - Länge
def test_length
  assert_equal(0, @stack.length, "Die Länge ist falsch!")
end

# Test - Letztes Element wird entfernt
def test_pop
  assert_equal(@stack, @stack.pop, "Diese Karte ist falsch!")
end

# Test - Oberstes Element wird ausgegeben
def test_peek
  assert_equal(nil, @stack.peek, "Diese Karte ist falsch!")
end

# Test - Empty
def test_empty
  assert_equal(true, @stack.empty?, "Fehler!")
end
end