# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 29. Dezember 2017
# Testklasse zu Mastermind

require "test/unit"
require_relative "mastermind.rb"
require_relative "mastermind_ai.rb"

class TestMastermind < Test::Unit::TestCase

def setup()
  @rounds_left = 10
  @mara = MasterMind.new
  @emi = MasterMindAI.new
  @elements = ["pink", "blue", "yellow", "green", "grey", "red"]
  @kombination_computer = @mara.kombination_mensch
  @length = 4
end

# Test - 10 Runden
def test_rounds
  assert_equal(10, @rounds_left)
  assert_equal(0, @rounds_left - 10)
end

# Test - Zufällige Kombination des Computers 
def test_kombination_computer
  permutation = @elements.repeated_permutation(4)
  assert_equal(@kombination_computer.include?(permutation.sample))
end




end