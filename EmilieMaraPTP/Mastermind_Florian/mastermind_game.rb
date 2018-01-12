#Klasse MastermindGame
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident
require_relative "err.rb"

#Klasse MastermindGame, Oberklasse fuer MastermindBreaker und -Maker
class MastermindGame

  #Initialisieren. Mitzugebende Parameter: Anzahl der Farben und Selektionsweite. Die Anzahl der maximalen Runden ist immer 10
   def initialize(amount_colors,amount_selection)
     raise MastermindIllegalValueError unless amount_colors.class==Integer &&  amount_selection.class==Integer && amount_colors>0 && amount_selection>0
     @AMOUNT_COLORS = amount_colors
     @AMOUNT_SELECTION = amount_selection
     @TOTAL_ROUNDS = 10
     reset()
   end
  
  #Stellt den Anfangszustand beim Erstellen des Objekts wieder her. Gibt Self zurueck. Benoetigt keine mitzugebenden Parameter.
  def reset()
    @round = 1
    @code = generate_code(@AMOUNT_COLORS,@AMOUNT_SELECTION)
    @game_end = false
    @won = nil
    reset_local()
    self
  end

  #Gibt eine Kopie des Loesungsarrays zurueck. Es duerfen keine Parameter mitgegeben werden. Wenn das Spiel nicht zu Ende ist, dann wird ein MastermindIllegalContentError geworfen.
  def solution()
    raise MastermindIllegalContentError if !@game_end
    @code.flatten.clone
  end

  #Zum Auslesen der Anzahl der Farben. Benoetigt keine mitzugebenden Parameter. Gibt einen Integer >0 zurueck.
  def amount_colors()
    @AMOUNT_COLORS.clone
  end

  #Zum Auslesen der Selektionsweite. Benoetigt keine mitzugebenden Parameter. Gibt einen Integer >0 zurueck.
  def amount_selection()
    @AMOUNT_SELECTION.clone
  end

  #Zum Auslesen der Runde. Benoetigt keine mitzugebenden Parameter. Gibt einen Integer (0<Integer<=10) zurueck.
  def round()
    @round.clone
  end

  #Zum Abfragen, ob das Spiel zu Ende ist. Benoetigt keine mitzugebenden Parameter. Gibt true oder false zurueck.
  def end?()
    @game_end.clone
  end

  #Zum Abfragen, ob die Person gewonnen hat. Benoetigt keine mitzugebenden Parameter. Wirft einen MastermindIllegalContentError, falls end? falsch ist, sonst gibt es true oder false zurueck.
  def won?()
    raise MastermindIllegalContentError unless @game_end
    @won.clone
  end

  private

  #Stellt den Anfangszustand beim Erstellen des Objekts wieder her. Gibt Self zurueck. Benoetigt keine mitzugebenden Parameter. Kann ueberschrieben werden.
  def reset_local()
    self
  end

  #Vergleicht fuer die request die Anordnungen
  def compare_array_mastermind(ary,right_code)
    result_right = []
    result_other_col_position = 0
    use_ary = ary.clone
    right_ary = right_code.clone
    use_ary.each_index{|n|
      result_right.push(n)  if (use_ary[n] == right_ary[n])
    }
    unless result_right.empty?()
      result_right.sort!.reverse!
      result_right.each{|n|
        o = n
        use_ary.delete_at(o)
        right_ary.delete_at(o)
      }
    end
    use_ary.each{|n|
      i = right_ary.index(n)
      unless i.nil?
        result_other_col_position+=1
        right_ary.delete_at(i)
      end
    }
    return [result_right.length(),result_other_col_position]
  end

end