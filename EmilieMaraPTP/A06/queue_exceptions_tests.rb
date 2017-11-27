# Author:: Mara von Kroge, Emilie Schuller
# 26. Noevember 2017
# TeamChallenger
# Tests zur Klasse Queue

require 'test/unit'
require_relative 'queue_exceptions'
require StandardError

class TestQueue < Test::Unit::TestCase < StandardError
  
  # Neues Array wird erstellt.
def setup()
  @queue=Queue.new
end

# Test - Initialize 
def test_initialize
  assert_not_equal(nil, @queue, "Dies ist kein leeres Array!")
end

# Test - Raise
def test_assert_raise
  @queue.enqueue(nil)
  assert_raise(IOError, @queue , "Fehler!")
end

# Test - Raise IndexError
#def test_raise_IOError
#  @queue.enqueue(nil)
#  exception = assert_raise(IOError) 
#  assert_equal("Please add a valid value!", exception.message)
#end

# Test - Element hinzufügen
def test_enqueue
  @queue.enqueue("Cookie Dough")
  assert_equal("Cookie Dough", @queue.peek, "Diese Eissorte ist falsch!")
end

# Test - Länge
def test_size
  assert_equal(0, @queue.length, "Die Länge ist falsch!")
end

# Test - Element entfernen
def test_dequeue
  assert_equal(0, @queue.length, "Diese Eissorte ist falsch!")
end

# Test - Erstes Element ausgeben
def test_peek
  @queue.enqueue("Cookie Dough")
  assert_equal("Cookie Dough", @queue.peek, "Diese Eissorte ist falsch!")
end

# Test - Empty
def test_empty
  assert_equal(true, @queue.empty?, "Fehler!")
end


end