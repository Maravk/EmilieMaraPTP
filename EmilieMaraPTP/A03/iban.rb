#Author:: Rico Helmboldt, Emilie Sarina Schuller, 20. Oktober 2017
#IBAN-Aufgabe - Berechnung der Prüfziffer

# Begrüßung des Nutzers sowie kurze Einführung und Erklärung des Programmes.
puts "Guten Tag! Dieses Programm wird Ihnen anhand Ihrer spezifischen Länderkennung, Ihrer Kontonummer sowie Ihrer Bankleitzahl Ihre individuelle IBAN ermitteln!"

# Leerzeichen für die Formatierung
puts''

#Eine Klasse namens "Iban" wird erstellt.
# Folgende Parameter weren erstellt: "Länderkennung, Kontonummer, Bankleitzahl" und alle werden initialisert
# Die Kontonummer wird stets großgeschrieben und die Kontoummer wird stets direkt zu einem String und dann zu einem Array gewandelt.

class Iban
  def initialize (laenderkennung, kontonummer, bankleitzahl)
    @laenderkennung = laenderkennung.upcase
    @bankleitzahl = bankleitzahl
    @kontonummer = kontonummer.to_s.each_char.to_a

    # Sofern die Kontonummer nicht der Länge "10" entspricht, soll diese Zahl stets ganz vorne mit Nullen aufgefüllt werden.
    # times-Schleife wird hierfür erstellt, welche die Kontonummer durchgeht und testet, wie viele Nullen hinzugefühgt werden müssen.
    # Methode ".insert" stellt stets an die jeweils 0.Stelle im Array "kontonummer" eine Null.
    if @kontonummer.length != 10
      (10-@kontonummer.length).times {
        @kontonummer.insert(0, '0')
      }
    end

    
    # Die Bankleitzahl wird unter der Variable "bban" gespeichert und zu einem String gemacht.
    # Jede Stelle des Arrays "kontonummer" wird an die Bankleitzahl gehängt.
    bban = @bankleitzahl.to_s
    @kontonummer.each { |zahl|
      bban << zahl
    }

    
    # Die jeweilige zweistellige Länderkennung wird in Grpßbuchstaben geschrieben und in ein Array gewandelt.
    # Von diesem Array wird die Blockvariable "buchstabe" erstellt.
    # Der jeweilige Stelle des Buchstaben wird im ASCII-Code gesucht und davon wird die Stelle des Buchstaben 'A' im ASCII-Code abgezogen.
    # Hierdurch erhält man die Stelle des Buchstaben im Alphabet und man fügt die 10 hinzu.
    zum_anhaengen = ''
    laenderkennung.upcase.each_char.to_a.each { |buchstabe|
      zum_anhaengen << (buchstabe.ord - 'A'.ord + 10).to_s
    }

    # Zwei Nullen sowie die Variable "zum_anhaengen" werden an die "bban" gehängt.
    bban << zum_anhaengen << '00'

    # Unter der Varibale "nummer" wird nun die "bban" als String gespeichert.
    # Das Modulo von dem Wert der Variable "nummer" und der 97 wird berechnet.
    # Der überschriebenen Variable "nummer" wird nun die Differenz aus der "nummer" und der 98 zugewiesen.
    nummer = bban.to_i
    nummer = nummer % 97
    nummer -= 98

    # Neuer Parameter namens "pruefziffer_fertig" wird erstellt und ihm wird der Wert 0 zugewiesen
    # Sofern der Wert der Variable "nummer" kleiner als 10 ist, soll der Wert absolute "nummer" an den Parameter "pruefziffer_fertig" gehängt werden.
    # Ist der Wert der Variable "nummer" nicht kleiner als 10, soll bloß der Wert der Variable "nummer" als absoluter Wert dargestellt werden. 
    @pruefziffer_fertig = '0'
    nummer < 10 ? @pruefziffer_fertig << nummer.abs.to_s : @pruefziffer_fertig = nummer.abs.to_s
  end
  
  # Neue Methode "to_s" wird definiert.
  # Die Variable "fertige_kontonummer" wird als String gespeichert.
  # Nun wird der Wert der Variablen "kontonummer" Schritt für Schritt durchgegangen, und der Wert der "fertigen_Zahl" wird quasi in den bisher leeren String hineingeschrieben.
  def to_s
    fertige_kontonummer = ''
    @kontonummer.each { |fertige_zahl|
      fertige_kontonummer << fertige_zahl
    }
    
    #Die Länderkennung, die Prüfziffer, die Bankleitzahl sowie die Kontonummer werden ausgegeben.
   puts "Ihre Prüfziffer lautet: #{@pruefziffer_fertig}"
   puts "Ihre fertige IBAN lautet: #{@laenderkennung} #{@pruefziffer_fertig} #{@bankleitzahl.to_s} #{fertige_kontonummer}"
    
  end
end