# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Queue

require 'test/unit'
require_relative 'aufgabe_1'

class TestQueue < Test::Unit::TestCase

def setup()
  @queue=Queue.new
  @queue=[]
end

def test_initialize
  assert_equal([], @queue, "Dies ist kein leeres Array!")
end

def test_enqueue
  assert_equal(["Cookie Dough"], @queue.push("Cookie Dough"), "Diese Eissorte ist falsch!")
end

def test_size
  assert_equal(0, @queue.size, "Die Länge ist falsch!")
end

def test_dequeue
  assert_equal(nil, @queue.shift, "Diese Eissorte ist falsch!")
end


def test_peek
  assert_equal(nil, @queue.first, "Diese Eissorte ist falsch!")
end
end