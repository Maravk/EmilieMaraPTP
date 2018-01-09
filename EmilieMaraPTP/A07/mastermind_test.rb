# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 29. Dezember 2017
# Testklasse zu Mastermind

require "test/unit"
require_relative "mastermind.rb"

class TestMasterMind < Test::Unit::TestCase

  def setup()
    @rounds_left = 10
    @round = 0
    @mara = MasterMind.new
    @elements = ["pink", "blue", "yellow", "green", "grey", "red",1,2,3,4,5,6]
    @length = 4
  end
  
  # Test - Neues Spiel
  def test_new_game
    assert_equal(0, @round)
  end
  
  # Länge der zufälligen Kombination
  def test_generate_code
    @code = @mara.generate_code
    assert_equal(@length, @code.length)
  end
  
  # Test - 10 Runden
  def test_rounds
    assert_equal(10, @rounds_left)
  end
  
  # Korrektes Erkennen der Black und White Hits
  def test_black_white_hits
    @mara.change_input(["pink", "blue", "yellow", "yellow"])
    @mara.change_code(["pink", "blue", "grey", "yellow"])
    assert_equal([3,0],@mara.compare_codes)
  end
end