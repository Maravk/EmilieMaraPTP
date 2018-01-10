# Author:: Mara von Kroge
# Author:: Emilie Schuller
# 10.Januar 2018
# Vergleichsmethode für Mastermind

class MastermindCompare
  
  # Vergleicht zwei Codes 
  # Rückgabe der Anzahl der Direkten und Indirekten Treffer
    def compare_codes(code_one, code_two)
      
      # Klone werden erstellt, damit der originale Inhalt nicht verändert wird.
      code1 = code_one.clone
      code2 = code_two.clone
      black_hits = 0
      white_hits = 0
  
      # Direkte Treffer
      # Stellen der Treffer werden mit ungültigen Werten überschrieben, 
      # um wiederholte Zählung bei Indiekten Treffern zu vermeiden.
      code1.each_index { |index|
        if code1[index] == code2[index]
          code1[index] = 0
          code2[index] = -1
          black_hits += 1
        end
      }
  
      # Indirekte Treffer
      # Stellen der Treffer werden mit ungültigen Werten überschrieben, 
      # um wiederholte Zählung zu vermeiden.
      code1.each_index { |index1|
        code2.each_index { |index2|
          if code1[index1] == code2[index2]
            code1[index1] = 0
            code2[index2] = -1
            white_hits += 1
          end
        }
      }
      
      # Rückgabe eines Arrays
      # Direkte Treffer stehen beim 0. Index
      # Indirekte Treffer stehen beim 1. Index
     return [black_hits, white_hits]
    end
  end  
end