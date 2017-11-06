# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Stack

require 'test/unit'
require_relative 'aufgabe_2'

class TestStack < Test::Unit::TestCase

def setup()
  @stack=Stack.new
  @stack=[]
  
end

def test_push
  @stack.push("Dame")
  assert_equal("Dame", @stack, "Diese Karte ist falsch!")
#  @stack=Stack.new("König")
#  assert_equal("König", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
#  @stack=Stack.new("Ass")
#  assert_equal("Ass", @stack.hinzufuegen_am_ende, "Diese Karte ist falsch!")
end

def test_pop
  assert_equal(nil, @stack.pop, "Diese Karte ist falsch!")
end

def test_peek
  assert_equal(nil, @stack.peek, "Diese Karte ist falsch!")
end

end