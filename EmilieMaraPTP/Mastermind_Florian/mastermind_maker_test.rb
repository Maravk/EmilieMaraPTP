#Test der Klasse MastermindTest
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident

require 'test/unit'

require_relative "mastermind_maker"

class MastermindMakerTest < Test::Unit::TestCase
  def setup
    @obj1 = MastermindMaker.new(6,4)
  end

  #Vergleicht fuer die request die Anordnungen. Ist eigentlich eine private Methode von MastermindGame, ist aber wichtig zu pruefen.
  #Bekommt als Argumente den Array vom Raten uebergeben, sowie den echten richtigen Code.
  def compare_array_mastermind(ary,code)
    result_right = []
    result_other_col_position = 0
    use_ary = ary.clone
    right_ary = code.clone
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

  #Ob die Anzahl der Farben, der aktuellen Runde, die Angabe, ob das Spiel zu Ende ist und die Kombinationsweite richtig initialisiert wurden.
  def test_initialize()
    assert_equal(6,@obj1.amount_colors())
    assert_equal(4,@obj1.amount_selection())
    assert_equal(1,@obj1.round())
    assert_equal(false, @obj1.end?())
  end

  #Ob die to_s-Methode die Inhalte (Runde, Spielende?, wenn ja, Gewonnen?) richtig darstellt.
  def test_to_s()
    assert_equal("Mastermind Code Maker, round 1, game has not ended.",@obj1.to_s())
    while @obj1.request([1,1,1,1])==[4,0]
      assert(@obj1.end?())
      @obj1 = MastermindMaker.new(6,4)
    end
    assert_equal("Mastermind Code Maker, round 2, game has not ended.",@obj1.to_s())
    while !(@obj1.end?)
      req_res = @obj1.request([1,1,1,1])
      @obj1 = MastermindMaker.new(6,4) if req_res == [4,0]
    end
    assert_equal("Mastermind Code Maker, round 10, game has ended, you lost.",@obj1.to_s())
  end

  #Ob bei einer falschen Argumentuebergabe ein MastermindIllegalValueError geworfen wird.
  def test_initialize_error()
    assert_raise(MastermindIllegalValueError){MastermindMaker.new("Hello", 2)}
    assert_raise(MastermindIllegalValueError){MastermindMaker.new(2, "Hello")}
    assert_raise(MastermindIllegalValueError){MastermindMaker.new(2, 0)}
    assert_raise(MastermindIllegalValueError){MastermindMaker.new(0, 2)}
  end

  #Ob die Anzahl der Runden mit jedem Versuch bis 10 erhoeht wird.
  def test_round_game_end()
    while @obj1.request([1,1,1,1])==[4,0]
      assert(@obj1.end?())
      @obj1 = MastermindMaker.new(6,4)
    end
    assert_equal(2, @obj1.round())
    refute(@obj1.end?())
    for i in 3..10
      @obj1.request([1,1,1,1])
      assert_equal(i, @obj1.round())
    end
    @obj1.request([1,1,1,1])
    assert(@obj1.end?())
  end

  #Test, ob die Inhalte der Anfrage zulaessig sind, richtig erkannt werden und wenn falsch, als falsch entlarvt werden.
  def test_request_valid?()
    refute(@obj1.request_valid?([]))
    refute(@obj1.request_valid?([1,1]))
    refute(@obj1.request_valid?([1,1,1]))
    refute(@obj1.request_valid?([0,0,0,0]))
    refute(@obj1.request_valid?([7,1,1,1]))
    refute(@obj1.request_valid?([1,7,1,1]))
    refute(@obj1.request_valid?([1,1,7,1]))
    refute(@obj1.request_valid?([1,1,1,7]))
    refute(@obj1.request_valid?([1,1,1,1,1]))
    assert(@obj1.request_valid?([1,1,1,1]))
    assert(@obj1.request_valid?([6,6,6,6]))
    assert(@obj1.request_valid?([1,2,5,6]))
  end

  #Ob ein Error bei falschen requests geworfen wird
  def test_request_error()
    assert_raise(MastermindIllegalValueError){@obj1.request([])}
    assert_raise(MastermindIllegalValueError){@obj1.request([1,1])}
    assert_raise(MastermindIllegalValueError){@obj1.request([1,1,1])}
    assert_raise(MastermindIllegalValueError){@obj1.request([0,0,0,0])}
    assert_raise(MastermindIllegalValueError){@obj1.request([7,1,1,1])}
    assert_raise(MastermindIllegalValueError){@obj1.request([1,7,1,1])}
    assert_raise(MastermindIllegalValueError){@obj1.request([1,1,7,1])}
    assert_raise(MastermindIllegalValueError){@obj1.request([1,1,1,7])}
    assert_raise(MastermindIllegalValueError){@obj1.request([1,1,1,1,1])}
  end

  #Ob bei Request ein Array zurueckgegeben wird und dieser die Laenge 2 hat.
  def test_request()
    request_result = @obj1.request([1,1,1,1])
    assert(@obj1.request([1,1,1,1]))
    assert(@obj1.request([1,1,1,1]).length == 2)
  end

  #Ob bei won? eine Exception geworfen wird wenn das Spiel noch nicht zu Ende ist,
  def test_won_error()
    refute(@obj1.end?)
    assert_raise(MastermindIllegalContentError){@obj1.won?}
  end

  #Ob das Spiel verloren ist, wenn das Spiel geendet hat und kein Treffer erzielt wurde und ob dann die Loesung zurueckgegeben wird..
  def test_won_solution()
    while !(@obj1.end?)
      req_res = @obj1.request([1,1,1,1])
      @obj1 = MastermindMaker.new(6,4) if req_res == [4,0]
    end
    refute(@obj1.won?)
    assert(@obj1.request_valid?(@obj1.solution()))
  end

  #Ob beim Versuch des Erhalts einer Loesung ein MastermindIllegalContentError geworfen wird, wenn das Spiel nicht zu Ende ist.
  def test_solution_error()
    assert_raise(MastermindIllegalContentError){@obj1.solution()}
  end

  #Ob bei einem verlorenem Spiel der Reset alles zum Anfang zuruecksetzt.
  def test_reset()
    unless @obj1.end?()
      req_res = @obj1.request([1,1,1,1])
      @obj1 = MastermindMaker.new(6,4) if req_res == [4,0]
    end
    @obj1.reset()
    assert_equal(6,@obj1.amount_colors)
    assert_equal(4,@obj1.amount_selection)
    assert_equal(1,@obj1.round)
    assert_equal(false, @obj1.end?())
  end

  #Prueft, ob die Vergleichergebnisse mit denen sich aus den Regeln ergebenden uebereinstimmen.
  def test_compare_array_mastermind()
    assert_equal([0,0],compare_array_mastermind([1,1,1,1],[2,2,2,2]))
    assert_equal([0,0],compare_array_mastermind([3,6,5,8],[4,2,2,4]))
    assert_equal([4,0],compare_array_mastermind([1,2,3,4],[1,2,3,4]))
    assert_equal([4,0],compare_array_mastermind([2,2,2,2],[2,2,2,2]))
    assert_equal([0,1],compare_array_mastermind([1,2,3,4],[5,4,5,6]))
    assert_equal([0,2],compare_array_mastermind([2,2,3,4],[1,1,2,3]))
    assert_equal([1,0],compare_array_mastermind([2,2,3,4],[1,2,5,6]))
    assert_equal([2,0],compare_array_mastermind([2,2,3,4],[1,2,5,4]))
    assert_equal([2,0],compare_array_mastermind([2,2,2,2],[2,2,6,4]))
    assert_equal([1,3],compare_array_mastermind([5,2,3,4],[4,2,5,3]))
    assert_equal([0,4],compare_array_mastermind([2,3,4,5],[4,2,5,3]))
    assert_equal([0,2],compare_array_mastermind([2,2,3,4],[5,6,2,2]))
  end

  #Prueft, ob der Tipp richtig ist.
  def test_hint()
    hint = @obj1.hint()
    ary =  @obj1.request([hint,hint,hint,hint])
    assert(ary[0] > 0)
    assert(ary[1] == 0)
  end
end
