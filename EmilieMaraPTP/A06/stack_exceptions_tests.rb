# Author:: Mara von Kroge, Emilie Schuller
# 27.11.2017
# TeamChallenger
# Tests zur Klasse Stack


# Dateien werden angefordert.
require 'test/unit'
require_relative 'stack_exceptions'

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
  assert_raise TypeError do @stack.push(nil)
  end
end

# Test - Länge
def test_length
  assert_equal(0, @stack.length, "Die Länge ist falsch!")
end

# Test - Letztes Element wird entfernt
def test_pop
  @stack.push("König")
  assert_equal("König", @stack.peek, "Diese Karte ist falsch!")
  @stack.pop
  assert_equal(0, @stack.length, "Diese Karte ist falsch!")
  assert_raise IndexError do @stack.pop
  end
end

# Test - Oberstes Element wird ausgegeben
def test_peek
  @stack.push("Ass")
  assert_equal("Ass", @stack.peek, "Diese Karte ist falsch!")
  @stack.pop
  assert_equal(0, @stack.length, "Diese Karte ist falsch!")
  assert_raise IndexError do @stack.peek
  end
end

# Test - Empty
def test_empty
  assert_equal(true, @stack.empty?, "Fehler!")
end

# Test - To_s
def test_to_s
  @stack.push("Sieben")
  assert_equal("Sieben", @stack.peek, "Diese Karte ist falsch!")
  @stack.pop
  assert_equal(0, @stack.length, "Diese Karte ist falsch!!")
  assert_raise IndexError do @stack.to_s
  end
end
end