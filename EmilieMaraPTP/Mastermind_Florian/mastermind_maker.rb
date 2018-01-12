#Klasse MastermindMaker
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident
require_relative "err.rb"
require_relative "mastermind_game.rb"

#Klasse MastermindMaker, repraesentiert bei dem Spiel Mastermind denjenigen, der sich einen Code ausdenkt.
class MastermindMaker < MastermindGame
  #Initialisieren der Klasse, benoetigt die Integer fuer die Anzahl der Farben und der Selektionsweite (>0),
  #sonst wird ein MastermindIllegalValueError geworfen.
  def initialize(amount_colors,amount_selection)
    super(amount_colors,amount_selection)
  end

  #Zur Ausgabe des Objekts und der Spielinformationen als String
  def to_s
    str = "Mastermind Code Maker, round #{@round}, game has #{@game_end ? "ended, you #{@won ? "won." : "lost."}" : "not ended."}"
  end

  #Prueft, ob der mitzugegebende Parameter ein Array ist und ob er die Laenge @AMOUNT_SELECTION hat und ob jeder Eintrag >0 und <= @AMOUNT_COLORS.
  #Gibt true oder false zurueck. Dient der Ueberpruefung, ob die Anfrage, die mitgegeben wird, richtig gestellt ist
  def request_valid?(ary)
    ary.is_a?(Array) && ary.length == @AMOUNT_SELECTION && !(ary.any?{|n| !(n.is_a? Integer) || n<1 || n>@AMOUNT_COLORS})
  end

  #Nutzt den mitzugebenden Parameter (Array, siehe Bedingungen fuer request_valid?) (dafuer muss request_valid == true sein, sonst gibt es einen MastermindIllegalValueError) und prueft, wie viele Eintraege im Array
  #mit der Position uebereinstimmen und bei welchen die Farbe (an einer vorgeschlagenen Stelle) nur nicht an der richtigen Stelle ist, aber in der Loesung enthalten ist. Wenn das Spiel schon zu Ende ist, wird ein MastermindIllegalContentError geworfen.
  #Gibt einen Array [Anzahl der richtigen Stellen, Anzahl der nicht passenden Position aber passender Farbe] zurueck.
  def request(ary)
    raise MastermindIllegalValueError unless request_valid?(ary)
    raise MastermindIllegalContentError if @game_end
    result = compare_array_mastermind(ary,@code)
    check_end_won(result[0])
    result
  end

  #Gibt dem Nutzer einen Tipp einer enthaltenen Farbe (als Zahl). Benoetigt keine mitzugebenden Parameter. Gibt immer den gleichen Tipp als Zahl(Integer) zurueck.
  def hint()
    @hint ||=nil
    @hint = @code[rand(0..@code.length-1)].clone if @hint.nil?
    return @hint.clone
  end

  private

  #Generiert den Code. Gegeben sein muss die Anzahl der Farben und die Selektionsweite als Integer. Gibt den Code im Array zurueck
  def generate_code(am_colors,am_selection)
    ary_code = []
    for i in 1..am_selection
      ary_code.push(rand(1..am_colors))
    end
    ary_code
  end

  def check_end_won(black_hits)
    if black_hits == @AMOUNT_SELECTION
      @game_end = true
      @won = true
    elsif @round == @TOTAL_ROUNDS
      @game_end = true
      @won = false
    else
      @round += 1
    end
    return self
  end
end