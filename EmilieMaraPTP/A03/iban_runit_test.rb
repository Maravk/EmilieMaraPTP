# Author:: Mara von Kroge, Emilie Sarina Schuller, 21. Oktober 2017
# Testfälle für die IBAN-Aufgabe
# TeamChallenger

# Die benötigten Dateien werden angefordert.
require 'test/unit'
require_relative 'iban'


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
    assert_equal("36", @meine_iban.calc_pruefziffer, "Die Prüfziffer ist falsch")
  end
  
  
  # Test - IBAN wird ausgegeben
  def test_return_iban
    assert_equal("DE04345432340054874843", @meine_iban.return_iban, "IBAN ist falsch")
  end
  
  # Test - IBAN Prüfziffer Check
  # Im RUnit test resultiert diese Methode leider in einem Error "undefined method `upcase' for nil:NilClass"
  # Wir konnten diesen leider nicht mehr rechtzeitig beheben... Normal übers Skript ausgeführt
  # funktioniert diese Methode wunderbar.
  def test_check_iban
    assert_equal(true, @meine_iban.check_iban, "Der IBAN Test ist falsch")
  end
  
  # Test - Umwandlung von Buchstaben zu Zahlen
  def test_char_to_ascii
    assert_equal("101112", @meine_iban.char_to_ascii("abc"), "Char to Ascii - 65 ist falsch")
  end
  
end