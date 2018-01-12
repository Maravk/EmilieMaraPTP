#Klasse MastermindBreaker
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident
require_relative "err.rb"
require_relative "mastermind_game.rb"

#Klasse MastermindBreaker, repraesentiert bei dem Spiel Mastermind denjenigen, der einen Code raten muss, als Computer.
class MastermindBreaker < MastermindGame
  #Initialisieren der Klasse, benoetigt die Integer fuer die Anzahl der Farben und der Selektionsweite (>0), sonst wird ein MastermindIllegalValueError geworfen.
  def initialize(amount_colors,amount_selection)
    super(amount_colors,amount_selection)
    @latest_suggestion = nil
  end

  #Zur Ausgabe des Objekts/ der wichtigen Informationen als String.
  def to_s
    str = "Mastermind Code Breaker, round #{@round}, game has #{@game_end ? "ended." : "not ended. There are #{@code.length()} combinations left."}"
  end

  #Die Antwort, die als Array mitgegeben werden muss, darf nur zwei Integer (i>=0; i<=Kombinationsweite; Summe beider Integer <= Kombinationsweite, (es darf nicht i0 = (Selektionsweite -1) und i1 = 1 sein)) enthalten.
  #Gibt true oder false zurueck, je nach dem, ob die Antwort den oben beschriebenen Bedingungen entspricht oder nicht.
  def answer_valid?(ary)
    !(!ary.is_a?(Array) || ary.length() != 2 || ary.any?{|m| !m.is_a?(Integer) || m<0 || m> @AMOUNT_SELECTION } || (ary[0] + ary[1]) > @AMOUNT_SELECTION || (ary[0] == @AMOUNT_SELECTION -1 && ary[1] == 1))
  end

  #Gibt den naechsten Vorschlag (als Array) zurueck, wenn das Spiel nicht zu Ende ist und wenn der Vorschlag nicht schon einmal angefordert wurde, sonst wird ein
  #MastermindIllegalContentError geworfen. Benoetigt keine mitzugebenden Parameter.
  def get_suggestion()
    raise MastermindIllegalContentError if (@game_end || !@latest_suggestion.nil?)
    @latest_suggestion = get_best_combination(@code)
    @latest_suggestion.clone
  end

  #Nimmt die Antwort (als Array mitzugeben) zur Berechnung der naechsten Moeglichkeit entgegen. Dieser darf nur zwei Integer (i>=0; i<=Kombinationsweite; Summe beider Integer <= Kombinationsweite, (es darf nicht i0 = (Selektionsweite -1) und i1 = 1 gleichzeitig sein)) enthalten, ansonsten wird ein
  #MastermindIllegalValueError geworfen. Wenn das Spiel zu Ende ist oder der Vorschlag noch nicht aufgerufen wurde, wird ein MastermindIllegalContentError geworfen.
  #Wenn eine Antwort gegeben wird, die unmöglich ist, wird ebenfalls ein MastermindIllegalValueError geworfen. Gibt eine Referenz auf self zurueck.
  def declare_answer(ary_answer)
    raise MastermindIllegalContentError if (@game_end || @latest_suggestion.nil?)
    raise MastermindIllegalValueError if !answer_valid?(ary_answer)
    new_value = all_fitting_possibilities_left(@code, @latest_suggestion, ary_answer)
    if new_value == []
      return MastermindIllegalContentError
    elsif new_value.length() == 1
      @game_end = true
      @won = true
      @code = new_value
    else
      @code = new_value
      if @round == 10
        @game_end = true
        @won = false
      else
        @round +=1
      end
    end
    @latest_suggestion = nil
    self
  end

  private

  #Stellt den Anfangszustand beim Erstellen des Objekts wieder her. Gibt Self zurueck. Benoetigt keine mitzugebenden Parameter.
  def reset_local()
    @latest_suggestion = nil
    self
  end

  #Generiert einen Array mit allen Moeglichkeiten (gegeben sein muss: Anzahl der Farben und die Seleketionsweite (wie viel Auswahl pro Zug gemacht wird.))
  def generate_code(am_colors, am_selection)
    ary_code = (1..am_colors).to_a.repeated_permutation(am_selection).to_a
  end

  #Probiert die moeglichen Kombinationen der Farben (in Array gespeichert, muss mitgegeben werden) miteinander aus und speichert diese in einem Array von Hashes. Gibt die Kombination als Array zurueck,
  #die nach Knuths Algorithmus die wenigsten Moeglichkeiten uebrig laesst. Wenn Runde 1 ist, die Selektionsweite == 4 und Farbenanzahl == 6, dann wird [1,1,2,2] zurueckgegeben (spart Zeit).
  def get_best_combination(combination_ary)
    return [1,1,2,2] if @round == 1 && @AMOUNT_COLORS == 6 && @AMOUNT_SELECTION == 4
    ary = combination_ary.clone
    ary2 = combination_ary.clone
    res_ary = []
    ary.each_index{|n|
      hash = {}
      ary2.each{|m|
        local_result = compare_array_mastermind(ary[n],m)
        if hash.has_key?(local_result)
          hash[local_result] += 1
        else
          hash[local_result] = 1
        end
      }
      ary_for_maximum = []
      hash.each_value{|val|
        ary_for_maximum << val
      }
      res_ary[n] = ary_for_maximum.max()
    }
    index_of_result = res_ary.index(res_ary.min())
    return (ary[index_of_result]).clone
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