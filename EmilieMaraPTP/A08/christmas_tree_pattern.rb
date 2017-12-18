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
  
  # private Methode
  # Baut einen neuen Baum aus dem Aktuellen
  private
  def build()
    
    # Aktueller Baum wird geklont, die Kopie wird verarbeitet und ersetzt am Ende den richtigen Baum
    new_rowset = @rows.clone()
    
    # Jede Zeile des Baums wird verarbeitet.
    @rows.each() do |line|
      
      # Jede Zeile wird durch ein oder zwei Zeilen ersetzt.    
      new_line1 = Array.new
      new_line2 = Array-new
      
      # Algorithmus beginnt
      # Zeile 1: s20..sr0
      
      # Ist in der ersten Zeile nur eine Zahl vorhanden, entfällt der Algorithmus für diese Zeile.
      if(line.length > 1)
        
        # Man beginnt bei der zweiten Zahl und hängt eine 0 hinten ran.
        # -1 um den Index nicht zu überschreiten.
        for i in 1..line.size-1
          # Neuen Wert in neue Zeile 1 schreiben.
          new_line1.push(line[i]+"0")
        end
      end
      
      # Zeile 2 (s10 s11...sr−11 sr1)
      # Man beginnt bei der ersten Zahl und hängt eine 0 hinten ran.
      # -1 um den Index nicht zu überschreiten.
      for i in 0..line.size()-1
        
        # Man hängt ab der ersten Zahl immer eine 1 hinten ran.
        if i == 0
          new_line2.push(lines[i]+"0")
        end
        
        # Alle Zahlen mit der 1 erweitern und der neuen Zeile 2 hinzufügen.
        new_line2.push(lines[i]+"1")
      end
      
      # Ersetzen der Zeilen.
      index = new_lineset.find_index(line)
      new_lineset[index] = new_line2
      
      # Sofern die erste Zeile nicht leer ist, sollen 
      if !new_line1.empty?()
        # Inserts the given values before the element with the given index.
        new_lineset.insert(index, new_line1)
      end

    end
    
    # Überschreiben der Instanzvariable mit dem fertigen Inhalt.
    @rows = new_lineset
    
    return self
  end
  
  # Ausgabe der baumartigen Struktur
  public
  def print()
    
    # Instanzvariable beinhaltet Arrays in einem großen Array.
    # Beispiel: @rows = [["100", "101"], ["010", "110"], ["000", "001", "011", "111"]]
    # @rows[0][0] == "100"
    value_length = @rows[0][0].length
    
    # Die maximale Anzahl an Elementen wird gesucht, damit der Inhalt sich perfekt zentriert befindet.
    max_values = 0
    @rows.each() do |row|
    if row.size() > max_values
      max_values = row.size() 
    end 
    end 
    
    # Maximale Breite = (Elementgroesse * Elemente) + Anzahl an Leerzeichen 
    max_width = (value_length * max_values) + (max_values - 1)
    
    # Zeilenweise wird der Inhalt ausgegeben.
    @rows.each() do |row|
      
      # Anzahl der Leerzeichen links = Hälfte von (Maximallänge - ((Wortgröße * Wörter) + Leerzeichen)) 
      left_spaces = (max_width - (( value_length * row.size() ) + row.size() - 1)) / 2
      
      # Leerzeichen vorweg.
      row_string = " " * left_spaces
      
      # Jeden Wert der Zeile mit Leerzeichen getrennt dranhängen und ausgeben.
      row_string += row.join(" ")
      puts row_string
    end
  end
  
end

# Neues Objekt wird erstellt und ausgegeben.
t = Tree.new(8)
t.print()