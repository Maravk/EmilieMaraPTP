#Author:: Mara von Kroge, Emilie Sarina Schuller, 20. Oktober 2017
#IBAN-Aufgabe - Berechnung der Prüfziffer

# Begrüßung des Nutzers sowie kurze Einführung und Erklärung des Programmes.
puts "Guten Tag! Dieses Programm wird Ihnen anhand Ihrer spezifischen Länderkennung,\nIhrer Kontonummer sowie Ihrer Bankleitzahl Ihre individuelle IBAN ermitteln!"

# Leerzeichen für die Formatierung
puts''

# Eine Klasse namens "Iban" wird erstellt.
# Folgende Parameter weren erstellt: "Länderkennung, Kontonummer, Bankleitzahl" und alle werden initialisert
# Die Länderkennung wird stets großgeschrieben und die Nummern werden in einen String umgewandelt.

class Iban
  def initialize (laenderkennung, kontonummer, bankleitzahl)
    @laenderkennung = laenderkennung.upcase
    @bankleitzahl = bankleitzahl.to_s
    @kontonummer = kontonummer.to_s

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

    
    # Die bban besteht aus der Bankleitzahl und Kontonummer. Die String Arrays werden aneinander gehängt
    bban = ""
    bban = @bankleitzahl << @kontonummer
    puts "bban: " + bban
    
    # Die jeweilige zweistellige Länderkennung wird in Großbuchstaben geschrieben und in ein Array gewandelt.
    # Von diesem Array wird die Blockvariable "buchstabe" erstellt.
    # Der jeweilige Stelle des Buchstaben wird im ASCII-Code gesucht und davon wird die Stelle des Buchstaben 'A' im ASCII-Code abgezogen.
    # Hierdurch erhält man die Stelle des Buchstaben im Alphabet und man fügt die 10 hinzu.
    print "Länderkennung: "+ @laenderkennung
    zum_anhaengen = ""
    @laenderkennung.upcase.each_char.to_a.each { |buchstabe|
      zum_anhaengen << (buchstabe.ord - ('A'.ord)+10).to_s
    }
    puts ", konvertiert einzeln zu ascii integer + 10: " + zum_anhaengen

    # Zwei Nullen sowie die Variable "zum_anhaengen" werden an die "bban" gehängt.
    pruefziffer = ""
    pruefziffer << bban
    pruefziffer << zum_anhaengen << '00'
    puts "Nummer zur Kalkulation der Pruefziffer: " + pruefziffer

    # Unter der Varibale "pruefziffer" wird nun die "bban" als String gespeichert.
    # Das Modulo von dem Wert der Variable "pruefziffer" und der 97 wird berechnet.
    # Der überschriebenen Variable "pruefziffer" wird nun die Differenz aus der "pruefziffer" und der 98 zugewiesen.
    pruefziffer = pruefziffer.to_i
    pruefziffer = pruefziffer % 97
    puts "\"Nummer\" modulo 97: " + pruefziffer.to_s
    pruefziffer = 98 - pruefziffer
    if pruefziffer < 10
      pruefziffer = pruefziffer.to_s
      pruefziffer.insert(0, '0')
    end
    puts "98 minus \"Nummer\" = Prüfziffer: " + pruefziffer.to_s

    iban = ""
    iban << @laenderkennung << pruefziffer.to_s << bban.to_s
    puts "Fertige IBAN: " + iban
    
  end
end