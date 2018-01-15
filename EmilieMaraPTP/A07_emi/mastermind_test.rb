# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 14. Januar 2018
# Testklasse zu Mastermind

require "test/unit"
require_relative "mastermind.rb"

class MastermindTest < Test::Unit::TestCase
  
  def setup()
    @mm = MastermindIO.new
    @mara = Mastermind.new(4,6,10,self)
  end
  
  def test_generate_code
    @emi = @mara.generate_code(4,6)
    assert_equal(4, @emi.length)
    assert_equal((4.times(rand(1..6)).to_a), @emi)
  end
  
  def test_compare_codes()
   @m = @mara.compare_codes([6,1,2,1],[3,4,2,6])
    assert_equal([1,1],@m)
  end
end