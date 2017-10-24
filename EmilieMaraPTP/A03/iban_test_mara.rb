# Author:: Mara von Kroge, Emilie Sarina Schuller, 21. Oktober 2017
# Testfälle für die IBAN-Aufgabe

require 'test/unit'
require_relative 'iban_mara'

class Test_iban < Test::Unit::TestCase
  def setup()
    @meine_iban = Iban.new('DE', 54874843, 34543234)
  end
  
  def test_calc_bban
    assert_equal("345432340054874843", @meine_iban.calc_bban, "bban ist falsch")
  end
  
  def test_calc_pruefziffer
    assert_equal("04", @meine_iban.calc_pruefziffer, "Die Prüfziffer ist falsch")
  end
  
  def test_return_iban
    assert_equal("DE04345432340054874843", @meine_iban.return_iban, "IBAN ist falsch")
  end
  
  def test_char_to_ascii
    assert_equal("101112", @meine_iban.char_to_ascii("abc"))
  end
end