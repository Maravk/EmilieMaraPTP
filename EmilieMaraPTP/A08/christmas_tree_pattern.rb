# Author:: Dominik Tobaben, Emilie Schuller, Ralf Herrmann
# 17. Dezember 2017
# Christmas Tree Pattern


class Tree
  
  def initialize(n = 1)
    @rows = []
    @target_n = n
    @current_n = 1
    
    # Erste Ordnung ist festgelegt
    r = []
    r.push("0").push("1")
    @rows.push(r)
    
    # Bis zur n-ten Eingabe aufbauen
    until @current_n == @target_n
      build()
      @current_n += 1
    end
  end
  
  # Bauen der naechsten Ordnung
  # Baut einen neuen Baum aus dem Aktuellen
  private
  def build()
    
    # Aktuellen Baum klonen, die Kopie wird verarbeitet und ersetzt am Ende die aktuellen Zeilen
    new_rowset = @rows.clone()
    
    # Jede Zeile des Baums verarbeiten
    @rows.each() do | values |
      # Jede Zeile wird durch ein oder zwei Zeilen ersetzt      
      new_row1 = []
      new_row2 = []
      
      # Bauen von Zeile 1 (s20...sr0)
      # Für (row) r = 1 entfällt die erste Zeile.
      if(values.length > 1)
        # Bei 1 anfangen, weil die zweite Zahl fuer new_row1 genutzt wird
        # -1 um den index nicht zu ueberschreiten
        for i in 1..values.size()-1
          # Neuen Wert in neue Zeile 1 schreiben
          new_row1.push(values[i]+"0")
        end
      end
      
      # Bauen von Zeile 2 (s10 s11...sr−11 sr1)
      # Hier bei null anfangen, da alle Zahlen verarbeitet werden
      # -1 um den index nicht zu ueberschreiten
      for i in 0..values.size()-1
        # die Erste Zahl (hier index=0 im array) zusaetzlich mit der 0 erweitern
        if i == 0
          new_row2.push(values[i]+"0")
        end
        # Alle zahlen mit der 1 erweitern und der neuen Zeile 2 hinzufuegen 
        new_row2.push(values[i]+"1")
      end
      
      # Ersetzen der Zeilen
      # dafuer den aktuellen Index raussuchen
      index = new_rowset.find_index(values)
      new_rowset[index] = new_row2
      
      # Für row.values = 1 entfällt die erste Zeile.
      if !new_row1.empty?()
        # Inserts the given values before the element with the given index.
        new_rowset.insert(index, new_row1)
      end

    end
    
    @rows = new_rowset
    
    return self
  end
  
  # gibt den Baum in der Konsole aus
  public
  def print()
    
    # @rows enthaelt arrays (z.B.: [["100", "101"], ["010", "110"], ["000", "001", "011", "111"]]  )
    # @rows[0] ist das erste Array (z.B.: ["100", "101"] )
    # @rows[0][0] ist das erste element des ersten Arrays (z.B.: "100")
    value_length = @rows[0][0].length
    
    # Maximale Anzahl an Elementen suchen, damit korrekt Zentriert werden kann
    max_values = 0
    @rows.each() do | row |
      max_values = row.size() if row.size() > max_values
    end 
    
    # Maximale Breite = (Elementgroesse * Elemente) + Anzahl an Leerzeichen 
    max_width = (value_length * max_values) + (max_values - 1)
    
    # Zeilenweise ausgeben
    @rows.each() do | row |
      
      # Anzahl der Leerzeichen links = die haelfte von (maximallaenge - ((wortgroesse * woerter) + leerzeichen)) 
      left_spaces = (max_width - (( value_length * row.size() ) + row.size() - 1)) / 2
      
      # Leerzeichen vorweg
      row_string = " " * left_spaces
      # Jeden Wert der Zeile mit Leerzeichen getrennt dranhaengen und ausgeben
      row_string += row.join(" ")
      puts row_string
    end
  end
  
end


t = Tree.new(4)
t.print()