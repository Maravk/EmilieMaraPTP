# Author:: Mara von Kroge, Emilie Sarina Schuller, 21. Oktober 2017
# Testfälle für die IBAN-Aufgabe

# Die benötigten Dateien werden angefordert.
require 'test/unit'
require_relative 'iban_mara'


# Testklassse wird erstellt.
class Test_iban < Test::Unit::TestCase
  def setup()
    
    # Neues Objekt mit festegelegten Werten wird erstellt.
    @meine_iban = Iban.new('DE', 54874843, 34543234)
  end
  
  # Test - Kontonummer + Bankleitzahl
  def test_calc_bban
    assert_equal("345432340054874843", @meine_iban.calc_bban, "Die bban ist falsch")
  end
  
  
  # Test - Prüfziffer
  def test_calc_pruefziffer
    assert_equal(36, @meine_iban.calc_pruefziffer, "Die Prüfziffer ist falsch")
  end
  
  
  # Test - IBAN wird ausgegeben
  def test_return_iban
    assert_equal("DE04345432340054874843", @meine_iban.return_iban, "IBAN ist falsch")
  end
  
  
  # Test - Umwandlung von Zahlen zu Buchstabn
  def test_char_to_ascii
    assert_equal("101112", @meine_iban.char_to_ascii("abc"), "Char to Ascii - 65 ist falsch")
  end
end