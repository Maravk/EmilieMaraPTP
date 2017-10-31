# Author:: Mara von Kroge, Emilie Sarina Schuller, 20. Oktober 2017
# IBAN-Aufgabe - Berechnung der Prüfziffer
# TeamChallenger


# Eine Klasse namens "Iban" wird erstellt.
# Folgende Parameter weren erstellt: "Länderkennung, Kontonummer, Bankleitzahl" und alle werden initialisert
# Die Länderkennung wird stets großgeschrieben und die Nummern werden in einen String umgewandelt.
class Iban
  def initialize (laenderkennung, kontonummer, bankleitzahl)
    @laenderkennung = laenderkennung.upcase
    @bankleitzahl = bankleitzahl.to_s
    @kontonummer = kontonummer.to_s
    @pruefziffer = ""
    @bban = ""
    @iban = ""
    
    
    # Sofern die Kontonummer nicht der Länge "10" entspricht, soll diese Zahl stets ganz vorne mit Nullen aufgefüllt werden.
    # times-Schleife wird hierfür erstellt, welche die Kontonummer durchgeht und testet, wie viele Nullen hinzugefühgt werden müssen.
    # Methode ".insert" stellt stets an die jeweils 0. Stelle im Array "kontonummer" eine Null.
    if @kontonummer.length != 10
      (10-@kontonummer.length).times {
        @kontonummer.insert(0, '0')
      }
    end
    puts "Kontonummer: " + @kontonummer
    puts "Bankleitzahl: " + @bankleitzahl
  end
  
  
  # Methode "calc_bban" wird erstellt.
  # Die @bban besteht aus der Bankleitzahl und Kontonummer. Diese Werte werden aneinandergehängt.
  def calc_bban
    @bban = @bankleitzahl << @kontonummer
    puts "@bban: " + @bban
    return @bban
  end
  
  
  # Methode "char_to_ascii" wird erstellt.
  # Char bezeichnet die jeweilige Länderkennung und schreibt diese stets groß.
  # Die jeweilige Stelle der Buchstaben werden im ASCII-Code gesucht und davon wird die Stelle des Buchstaben 'A' im ASCII-Code abgezogen.
  # Hierdurch erhält man die Stelle des Buchstaben im Alphabet und man fügt die 10 hinzu.
  # Diese Zahlenwerte werden unter der Variable "ascii" gespeichert.
  def char_to_ascii(charinput)
    chars = charinput
    ascii = ""
    chars.upcase.each_char.to_a.each { |buchstabe|
      ascii << (buchstabe.ord - ('A'.ord)+10).to_s
    }
    return ascii
  end
    
  
 # Methode "cal_pruefziffer()" wird erstellt. 
  def calc_pruefziffer()

    print "Länderkennung: "+ @laenderkennung
    
    # Aufruf der Methode "char_to_ascii" mit dem Parameter @laenderkennung.
    zum_anhaengen = char_to_ascii(@laenderkennung)
    puts ", konvertiert einzeln zu ascii integer + 10: " + zum_anhaengen

    # Zwei Nullen sowie die Variable "zum_anhaengen" werden an die "@bban" gehängt.
    @pruefziffer << @bban << zum_anhaengen << '00'
    puts "Nummer zur Kalkulation der @pruefziffer: " + @pruefziffer

    
    # Die Variable "@pruefziffer" wird zum Integer gemacht.
    # Das Modulo von dem Wert der Variable "@pruefziffer" und der 97 wird berechnet.
    # Der überschriebenen Variable "@pruefziffer" wird nun die Differenz aus der "@pruefziffer" und der 98 zugewiesen.
    @pruefziffer = @pruefziffer.to_i
    @pruefziffer = @pruefziffer % 97
    puts "\"Nummer\" modulo 97: " + @pruefziffer.to_s
    @pruefziffer = 98 - @pruefziffer
    
    
    # Sofern die @pruefziffer < 10 ist, soll eine 0 vorangestellt werden.
    if @pruefziffer < 10
      @pruefziffer = @pruefziffer.to_s
      @pruefziffer.insert(0, '0')
    end
    puts "98 minus \"Nummer\" = Prüfziffer: " + @pruefziffer.to_s
    return @pruefziffer.to_s
  end
    
  
  # Methode "return_iban()" wird definiert.
  def return_iban()
    calc_bban
    calc_pruefziffer
    
    # Unter der Variable "@iban" werden die "@laenderkennung", "pruefziffer.to_s" sowie die "@bban.to_s" zusammengefügt.
    @iban << @laenderkennung << @pruefziffer.to_s << @bban.to_s
    return @iban
  end
  
  
  # Methode "check_this_iban(iban)" wird erstellt.
  # Der Variable  "@iban" wird der Wert der Variable "iban" zugewiesen.
  def check_this_iban(iban)
    @iban = iban
    check_iban
  end
  
  # Methode "check_iban" wird erstellt.
  # Unter der Variable "char" wird ein leerer String gespeichert und unter "iban_temp" die Variable "@iban".
  # In diesen leeren String werden die jeweiligen Buchstaben als Ziffern inklusive der Prüfziffer zusammengefasst.
  def check_iban
    char = ""
    iban_temp = @iban
    char << char_to_ascii(@iban[0])
    char << char_to_ascii(@iban[1])
    char << @iban[2] << @iban[3]
    
    
    # Von der Variable "iban_temp" werden die ersten vier Zeichen entfernt...
    iban_temp[0..3] = ''
    # ...und diese hinten an die Zahl zur Berechnung angehängt. (nach Modulus 97-10 (ISO 7064))
    iban_temp << char
    
    # Sofern das Modulo der IBAN und der Zahl 97 1 entspricht, ist die IBAN korrekt.
    if iban_temp.to_i % 97 == 1
      puts "Die IBAN ist korrekt!"
      return 1
    else
      puts "Die IBAN ist nicht korrekt!"
      return 0
    end
  end
end