# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

# Dateien werden angefordert.
require 'test/unit'
require_relative 'aufgabe_2'

# Testklasse wird erstellt.
class TestStack < Test::Unit::TestCase

  # Neues Array wird erstellt.
def setup()
  @stack=Stack.new
  @stack=["Dame", "König"]
end

# Test - Initialize
def test_initialize
  assert_equal(["Dame", "König"], @stack, "Dies ist kein leeres Array!")
end

# Test - Neues Element hinzufuegen
def test_push
  assert_equal(["Dame", "König", "Ass"], @stack.push("Ass"), "Diese Karte ist falsch!")
end

# Test - Laenge
def test_size
  assert_equal(2, @stack.size, "Die Länge ist falsch!")
end

# Test - Letzes Element wird entfernt
def test_pop
  assert_equal("Dame", @stack.shift, "Diese Karte ist falsch!")
end

# Test - Oberstes Element wird ausgegeben
def test_peek
  assert_equal("Dame", @stack.first, "Diese Karte ist falsch!")
end
end