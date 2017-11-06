# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

require 'test/unit'
require_relative 'aufgabe_2'

class TestStack < Test::Unit::TestCase

def setup()
  @stack=Stack.new
  @stack=[]
end

def test_initialize
  assert_equal([], @stack, "Dies ist kein leeres Array!")
end

def test_push
  assert_equal(["Dame"], @stack.push("Dame"), "Diese Karte ist falsch!")
end

def test_size
  assert_equal(0, @stack.size, "Die Länge ist falsch!")
end

def test_pop
  assert_equal(nil, @stack.shift, "Diese Karte ist falsch!")
end

def test_peek
  assert_equal(nil, @stack.first, "Diese Karte ist falsch!")
end
end