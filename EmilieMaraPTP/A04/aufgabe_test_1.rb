# Author:: Emilie Schuller, Mara von Kroge, 29. Oktober 2017
# Testfälle für die Klasse Queue

require 'test/unit'
require_relative 'aufgabe_1'

class TestQueue < Test::Unit::TestCase

def setup()
  @queue=Queue.new
end

def test_enqueue
  @queue.enqueue
  assert_equal("Karamel Sutra""Half Baked""Cookie Dough", @queue.enqueue, "Diese Eissorte ist falsch!")
end


def test_dequeue
  assert_equal("Karamel Sutra", @queue.dequeue, "Diese Eissorte ist falsch!")
end


def test_peek
  assert_equal("Half Baked", @queue.peek, "Diese Eissorte ist falsch!")
end
end