# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 14. Januar 2018
# Testklasse zu Mastermind

require "test/unit"
require_relative "mastermind.rb"

class MastermindTest < Test::Unit::TestCase
  
  def setup()
    @mmio = MastermindIO.new
    @mara = Mastermind.new(4,6,10,@mmio)
    @m = @mara.compare_codes([6,1,2,1],[3,4,2,6])
    @e = @mara.compare_codes([1,4,4,4],[3,4,4,4])
    @r = @mara.compare_codes([3,4,5,6],[3,4,5,6])
    @emi = @mara.generate_code(4,6)
    @valid_elements = ["1","2","3","4","5","6"]
    @lol = "lol"
  end
  
  # Code wird vom Computer generiert.
  def test_generate_code()
    assert_equal(4, @emi.length)
    assert_equal(true, @valid_elements.include?(@emi.sample))
    assert_equal(false, @valid_elements.include?(@lol))
  end
  
  # Überprüfung der Black und White Hits beim Vergleich zweier Codes
  def test_compare_codes()
    assert_equal([1,1],@m)
    assert_equal([3,0],@e)
    assert_equal([4,0],@r)
  end
end