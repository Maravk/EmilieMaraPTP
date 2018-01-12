# Author:: Emilie schuller
# Author:: Mara von Kroge
# 09.01.2018
# Tests für Mastermind - Computer ist Codebreaker


require "test/unit"
require_relative "mastermind_ai.rb"

class TestMastermindAI < Test::Unit::TestCase
  
  
  def setup()
    @mara = MastermindAI.new
  end
  
  # Korrektes Erkennen der Black und White Hits
  def test_black_white_hits
    @mara.change_input(["pink", "blue", "yellow", "yellow"])
    @mara.change_code(["pink", "blue", "grey", "yellow"])
    assert_equal([3,0],@mara.compare_codes)
  end
 
    
end