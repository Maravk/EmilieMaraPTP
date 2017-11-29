# Author:: Mara von Kroge, Emilie Schuller
# 26. Noevember 2017
# TeamChallenger
# Tests zur Klasse Queue

require 'test/unit'
require_relative 'queue_exceptions'

class TestQueue < Test::Unit::TestCase
  
  # Neues Array wird erstellt.
def setup()
  @queue=Queue.new
end

# Test - Initialize 
def test_initialize
  assert_not_equal(nil, @queue, "Fehler!")
end

# Test - Element hinzufügen
def test_enqueue
  @queue.enqueue("Cookie Dough")
  assert_equal("Cookie Dough", @queue.peek, "Fehler!")
  assert_raise TypeError do @queue.enqueue(nil)
  end 
end

# Test - Länge
def test_size
  assert_equal(0, @queue.length, "Fehler!")
end

# Test - Element entfernen
def test_dequeue
  @queue.enqueue("Karamel Sutra")
  assert_equal("Karamel Sutra", @queue.peek, "Fehler")
  @queue.dequeue
  assert_equal(0, @queue.length, "Fehler")
  assert_raise IndexError do @queue.dequeue
  end
end

# Test - Erstes Element ausgeben
def test_peek
  @queue.enqueue("Half Baked")
   assert_equal("Half Baked", @queue.peek, "Fehler")
   @queue.dequeue
  assert_equal(0, @queue.length, "Fehler!")
  assert_raise TypeError do @queue.peek
  end
end

# Test - Empty
def test_empty
  assert_equal(true, @queue.empty?, "Fehler!")
end

# Test - To_s
def test_to_s
  @queue.enqueue("What-A-Lotta-Chocoalte")
  assert_equal("What-A-Lotta-Chocoalte", @queue.peek, "Fehler!")
  @queue.dequeue
  assert_equal(0, @queue.length, "Fehler!")
  assert_raise IndexError do @queue.to_s
  end
end
end 