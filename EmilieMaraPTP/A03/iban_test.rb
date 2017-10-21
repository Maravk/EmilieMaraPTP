# Author:: Emilie Sarina Schuller, 21. Oktober 2017
# Testfälle für die IBAN-Aufgabe

require 'test/unit'
require_relative 'iban_script'

class Test_Iban < Test::Unit::TestCase
  def test_modulo
    assert_equal(63, iban.new(nummer).modulo(97))
    #iban_test1 = iban.new
    #expected = iban_test1.nummer = nummer % 97
   # assert_equal expected, 63
  end
end


  def test_equal
    assert_equal(063, iban.new(nummer).expected(063))
#    iban_test2 = iban.new
#    expected = iban_test2.nummer
#    assert_equal expected, 063
  end