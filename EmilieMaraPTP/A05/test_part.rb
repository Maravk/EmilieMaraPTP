# Author: Mara von Kroge, Emilie Schuller, 21. November 2017
# TeamChallenger
# Testklasse zu Teil

require 'test/unit'
require_relative 'part'

class TestTeilMara < Test::Unit::TestCase
  
  def setup()
    @parts_computer = Part.new("Computer")
  end
  
end

def test_initialize
  part = Part.new("Part",1)
  assert_equal("Part",part.name)
  assert_equal(1,part.mass)
  assert_equal(nil,part.parent)
end


#def test_teil_hinzufügen
  