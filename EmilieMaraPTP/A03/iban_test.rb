# Author:: Emilie Sarina Schuller, 21. Oktober 2017
# Testfälle für die IBAN-Aufgabe

require 'test/unit'
require_relative 'iban_script'

class Test_iban < Test::Unit::TestCase
  def test_modulo
    
    iban_test1 = iban.new
    expected = iban_test1.nummer = nummer % 97
   assert_equal expected, -20
  end
end


  def test_equal
   
    iban_test2 = iban.new
    expected = iban_test2.nummer
    assert_equal expected, 020
  end
  