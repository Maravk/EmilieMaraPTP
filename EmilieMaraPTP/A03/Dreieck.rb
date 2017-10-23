require 'v1_Geometrie/Point'
require 'v1_Geometrie/Leinwand'
require 'v1_Geometrie/Einstellungen'

class Dreieck

  # Wir gehen von einem gleichschenkligen Dreick aus
  # Siehe auch zeichne_dreieck in der Klasse Leinwand
  def initialize()
    # Alle Dreicke haben zu Beginn ihr Spitze im Punkt (100,100)
    @spitze = Point.new(50,15)
    # eine Hoehe  von 40 und Breite von 30
    @hoehe = 30
    @breite = 40
    # sind nicht sichtbar 
    @sichtbar = false
    # und sind grün
    @farbe = 'green'
  end
  
  # Ist das Dreieck sichtbar
  def sichtbar?
    return @sichtbar
  end

  def farbe()
    return @farbe    
  end
  
  def spitze()
    return @spitze
  end

  def hoehe()
    return @hoehe
  end
  
  def breite()
      return @breite    
  end
  # Mache das Dreieck sichtbar  
  def sichtbar_machen
      @sichtbar = true
      zeichnen()
      puts(self)      
  end
  
  # und unsichtbar
  def unsichtbar_machen
     loeschen()
     @sichtbar = false    
  end
  
  # Verschiebe das Dreieck im 10 Bildpunkte nach unten
  def nach_unten_bewegen
    bewegen_um_punkt(Point.new(0,10))
  end
  
  # Verschiebe das Dreieck um anzahl Bildpunkte horizontal
  def horizontal_bewegen(anzahl)
     bewegen_um_punkt(Point.new(anzahl,0))        
  end
  
  # Verschiebe das Dreieck um anzahl Bildpunkte vertikal
  def vertikal_bewegen(anzahl)
    bewegen_um_punkt(Point.new(0,anzahl))
  end
  
  # Bewegt das Dreieck langsam vertikal um 
  # entfernung Bildpunkte   
  def langsam_vertikal_bewegen(entfernung)
      absolute_entfernung = entfernung
      if( sichtbar?) 
        delta  = 1
        if entfernung < 0 
          delta = -1
          absolute_entfernung = - entfernung
        end  
        x_delta = 0
        y_delta = delta
        Leinwand.gib_einzige_instanz().
              bewege(self,absolute_entfernung,x_delta,y_delta)
      end 
      @spitze = @spitze + Point.new(0,entfernung)
  end

  
  # Methode für das Bewegen eines Dreieck
  def bewegen_um_punkt(punkt)
    @spitze = @spitze + punkt
    # Zeichne das verschobene Dreieck
      if (sichtbar?)
        Leinwand.gib_einzige_instanz().verschiebe(self,punkt.x,punkt.y)      
      end
  end
  
  # Ändere die Farbe des Dreiecks auf neue_farbe
  # Zeige das Dreieck mit der neuen Farbe an
  def farbe_aendern(neue_farbe)
      if  neue_farbe == "gruen"
        @farbe = :green
      end
      if neue_farbe == "rot" 
        @farbe = :red
      end
      if  neue_farbe == "blau"
        @farbe = :blue
      end
      if neue_farbe == "gelb"
        @farbe = :yellow
      end
      if neue_farbe == "weiss"
        @farbe = :white
      end
      if neue_farbe == "schwarz"
        @farbe = :black
      end
      if (sichtbar?)
          Leinwand.gib_einzige_instanz().farbe_aendern(self)   
      end    
  end

  def groesse_aendern(neue_breite,neue_hoehe)
     # Loesche zuerst die alte Darstellung
     loeschen()
     @hoehe = neue_hoehe
     @breite = neue_breite
     # Zeichne das skalierte Dreieck
     zeichnen()        
  end
  
  def to_s()
      return "dreieck #@nummer"      
  end
  
  def zeichnen()
      if sichtbar?()
        Leinwand.gib_einzige_instanz().zeichne_dreieck(self)
      end    
  end
  
  def loeschen()
      if sichtbar?()
        Leinwand.gib_einzige_instanz().loesche(self)
      end
  end
  
end