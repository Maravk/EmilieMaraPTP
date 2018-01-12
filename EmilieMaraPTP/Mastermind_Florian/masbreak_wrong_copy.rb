#Aeltere Version der Klasse MastermindBreaker, die NICHT richtig funktioniert. Fehler steckt vermutlich bei der Methode get_best_combination
#Bitte nur anschauen, wenn man Lust hat, den Fehler zu finden. Fuer die funktionierende Klasse MastermindBreaker, siehe "mastermind_breaker.rb"!
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident
require_relative "err.rb"

#Nicht wie gewuenscht funktionierende Klasse MastermindBreaker, repraesentiert bei dem Spiel Mastermind denjenigen, der sich einen Code raet.
#Fuer die richtig funktionierende Klasse siehe "mastermind_breaker.rb"!
class MastermindBreaker
  #Initialisieren der Klasse, benoetigt die Integer fuer die Anzahl der Farben und der Selektionsweite (>0), sonst wird ein MastermindIllegalValueError geworfen.
  def initialize(amount_colors,amount_selection)
    raise MastermindIllegalValueError unless amount_colors.class==Integer &&  amount_selection.class==Integer && amount_colors>0 && amount_selection>0
    @AMOUNT_COLORS = amount_colors
    @AMOUNT_SELECTION = amount_selection
    @TOTAL_ROUNDS = 10
    reset()
  end

  #Zur Ausgabe des Objekts als String
  def to_s
    str = "Mastermind Code Breaker, round #{@round}, game has #{@game_end ? "ended." : "not ended. There are #{@code.length()} combinations left."}"
  end

  #Zum Auslesen der Anzahl der Farben. Benoetigt keine mitzugebenden Parameter. Gibt einen Integer >0 zurueck.
  def amount_colors()
    @AMOUNT_COLORS.clone
  end

  #Zum Auslesen der Weite der Selektionsweite. Benoetigt keine mitzugebenden Parameter. Gibt einen Integer >0 zurueck.
  def amount_selection()
    @AMOUNT_SELECTION.clone
  end

  #Zum Auslesen der Runde. Benoetigt keine mitzugebenden Parameter. Gibt einen Integer (0<Integer<=10) zurueck.
  def round()
    @round.clone
  end

  #Zum Abfragen, ob der Computer gewonnen hat. Benoetigt keine mitzugebenden Parameter. Wirft einen MastermindIllegalContentError, falls end? falsch ist, sonst gibt es true oder false zurueck.
  def won?()
    raise MastermindIllegalContentError unless @game_end
    @won.clone
  end

  #Zum Abfragen, ob das Spiel zu Ende ist. Benoetigt keine mitzugebenden Parameter. Gibt true oder false zurueck.
  def end?()
    @game_end
  end

  #Stellt den Anfangszustand beim Erstellen des Objekts wieder her. Gibt Self zurueck. Benoetigt keine mitzugebenden Parameter.
  def reset()
    @round = 1
    @code = generate_code(@AMOUNT_COLORS,@AMOUNT_SELECTION)
    @game_end = false
    @won = nil
    @latest_suggestion = nil
    self
  end

  #Die Antwort, die als Array mitgegeben werden muss darf nur zwei Integer (i>=0; i<=Kombinationsweite; Summe beider Integer <= Kombinationsweite, (es darf nicht i0 = (Selektionsweite -1) und i1 = 1 sein)) enthalten.
  #Gibt true oder false zurueck, je nach dem, ob die Antwort den oben beschriebenen Bedingungen entspricht oder nicht.
  def answer_valid?(ary)
    !(!ary.is_a?(Array) || ary.length() != 2 || ary.any?{|m| !m.is_a?(Integer) || m<0 || m> @AMOUNT_SELECTION } || (ary[0] + ary[1]) > @AMOUNT_SELECTION || (ary[0] == @AMOUNT_SELECTION -1 && ary[1] == 1))
  end

  #Gibt den naechsten Vorschlag (als Array) zurueck, wenn das Spiel nicht zu Ende ist und wenn der Vorschlag nicht schon einmal angefordert wurde, sonst wird ein
  #MastermindIllegalContentError geworfen.
  def get_suggestion()
    return MastermindIllegalContentError if (@game_end || !@latest_suggestion.nil?)
    @latest_suggestion = get_best_combination(@code)
    @latest_suggestion.clone
  end

  #Nimmt die Antwort (als Array) zur Berechnung der naechsten Moeglichkeit entgegen. Dieser darf nur zwei Integer (i>=0; i<=Kombinationsweite; Summe beider Integer <= Kombinationsweite, (es darf nicht i0 = (Selektionsweite -1) und i1 = 1 gleichzeitig sein)) enthalten, ansonsten wird ein
  #MastermindIllegalValueError geworfen. Wenn das Spiel zu Ende ist oder der Vorschlag noch nicht aufgerufen wurde, wird ein MastermindIllegalContentError geworfen.
  # Wenn eine Antwort gegeben wird, die unmöglich ist, wird ebenfalls ein MastermindIllegalValueError geworfen. Gibt eine Referenz auf self zurueck.
  def declare_answer(ary_answer)
    return MastermindIllegalContentError if (@game_end || @latest_suggestion.nil?)
    return MastermindIllegalValueError if !answer_valid?(ary_answer)
    new_value = all_fitting_possibilities_left(@code, @latest_suggestion, ary_answer)
    if new_value == []
      return MastermindIllegalContentError
    elsif new_value.length() == 1
      @game_end = true
      @won = true
    else
      @code = new_value
      if @round == 10
        @game_end = true
        @won = false
      else
        @round +=1
      end
    end
    self
  end

  #Gibt eine Kopie des Loesungsarrays zurueck. Wenn das Spiel nicht zu Ende ist, dann wird ein MastermindIllegalContentError geworfen.
  def solution()
    raise MastermindIllegalContentError if !@game_end
    @code.flatten.clone
  end

  private

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

  #Generiert einen Array mit allen Moeglichkeiten (gegeben sein muss: Anzahl der Farben und die Seleketionsweite (wie viel Auswahl pro Zug gemacht wird.))
  def generate_code(am_colors, am_selection)
    ary_code = (1..am_colors).to_a.repeated_permutation(am_selection).to_a
  end

  #Probiert die moeglichen Kombinationen der Farben (in Array gespeichert, muss mitgegeben werden) miteinander aus und speichert diese in einem Array von Hashes. Gibt die Kombination als Array zurueck,
  #die nach Knuths Algorithmus die wenigsten Moeglichkeiten uebrig laesst.
  def get_best_combination(combination_ary)
    ary = combination_ary
    result = Array.new(ary.length(),{})
    ary.each_index{|n| ary.each{|m|
        b = compare_array_mastermind(ary[n],m)
        result[n][b].nil?() ? result[n][b]=0 : result[n][b] +=1
      }
      list_int = []
      result[n].each_value{|v| list_int << v}
      p @code[n]
      p list_int if n == 0
      result[n].each_key{|k| p k} if n == 0
      p list_int.max
      puts "ende"
      result[n]= list_int.max()
    }
    ary[result.index(result.min())]
  end

  #Gibt einen Kombinationsarray zurueck mit allen Kombinationen, die nach dem Raten moeglich sind.
  #Benoetigt zum Arbeiten den Array aller Kombinationen, der angefragten Kombination und des Ergebnisses.
  def all_fitting_possibilities_left(all_combinations,guess,hits)
    combinations_ary = all_combinations.clone
    guess_ary = guess
    hits_ary = hits
    combinations_ary.keep_if{|n| compare_array_mastermind(guess_ary,n) == hits}
    combinations_ary
  end
end