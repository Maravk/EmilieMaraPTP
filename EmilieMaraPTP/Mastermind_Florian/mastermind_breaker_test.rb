#Test der Klasse MastermindBreaker
#Author:: Florian Fleischhauer, Leon Driesch
#Team Trident

require 'test/unit'

require_relative "mastermind_breaker"

class MastermindBreakerTest < Test::Unit::TestCase
  def setup
    @obj1 = MastermindBreaker.new(6,4)
  end

  #Vergleicht fuer die request die Anordnungen. Ist eigentlich eine private Methode von MastermindGame, ist aber wichtig zu pruefen.
  #Bekommt als Argumente den Array vom Raten uebergeben, sowie den echten richtigen Code
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

  #Ob die Anzahl der Farben, der aktuellen Runde, die Angabe, ob das Spiel zu Ende ist und die Anzahl der Kombinationslaenge richtig initialisiert wurden.
  def test_initialize()
    assert_equal(6,@obj1.amount_colors())
    assert_equal(4,@obj1.amount_selection())
    assert_equal(1,@obj1.round())
    assert_equal(false, @obj1.end?())
  end

  #Ob die to_s-Methode die Inhalte (Runde, Spielende?, wenn ja, Gewonnen?) richtig darstellt.
  def test_to_s()
    puts @obj1
    assert_equal("Mastermind Code Breaker, round 1, game has not ended. There are 1296 combinations left.",@obj1.to_s())
    @obj1.get_suggestion()
    @obj1.declare_answer([2,0])
    assert_equal("Mastermind Code Breaker, round 2, game has not ended. There are 114 combinations left.",@obj1.to_s())

  end

  #Ob bei einer falschen Argumentuebergabe ein IllegalValueError geworfen wird.
  def test_initialize_error()
    assert_raise(MastermindIllegalValueError){MastermindBreaker.new("Hello", 2)}
    assert_raise(MastermindIllegalValueError){MastermindBreaker.new(2, "Hello")}
    assert_raise(MastermindIllegalValueError){MastermindBreaker.new(2, 0)}
    assert_raise(MastermindIllegalValueError){MastermindBreaker.new(0, 2)}
  end

  #Ob das Spiel wie erwartet zu Ende gespielt werden kann  und ob sich die Rundenanzahl mit erhoeht.
  def test_round_game_end()
    @obj1.get_suggestion()
    @obj1.declare_answer([4,0])
    assert(@obj1.end?())
    assert_equal(1, @obj1.round())

    setup()
    @obj1.get_suggestion()
    @obj1.declare_answer([1,1])
    refute(@obj1.end?())
    assert_equal(2, @obj1.round())
  end

  #Ob die Inhalte der Anfrage zulaessig sind.
  def test_answer_valid?()
    assert(@obj1.answer_valid?([0,0]))
    assert(@obj1.answer_valid?([0,1]))
    assert(@obj1.answer_valid?([0,2]))
    assert(@obj1.answer_valid?([0,3]))
    assert(@obj1.answer_valid?([0,4]))
    assert(@obj1.answer_valid?([1,0]))
    assert(@obj1.answer_valid?([1,1]))
    assert(@obj1.answer_valid?([1,2]))
    assert(@obj1.answer_valid?([1,3]))
    assert(@obj1.answer_valid?([2,0]))
    assert(@obj1.answer_valid?([2,1]))
    assert(@obj1.answer_valid?([2,2]))
    assert(@obj1.answer_valid?([3,0]))
    assert(@obj1.answer_valid?([4,0]))
    refute(@obj1.answer_valid?([]))
    refute(@obj1.answer_valid?([1,1,1]))
    refute(@obj1.answer_valid?([true,1]))
    refute(@obj1.answer_valid?([1,3.0]))
    refute(@obj1.answer_valid?([3,1]))
    refute(@obj1.answer_valid?([4,1]))
    refute(@obj1.answer_valid?([5,0]))
    refute(@obj1.answer_valid?([2,-1]))
    refute(@obj1.answer_valid?([-1,2]))
    refute(@obj1.answer_valid?(1))
  end

  #Ob ein Error bei falschen Antworten/wenn kein Vorschlag abgefragt wurde geworfen wird.
  def test_declare_answer_error()
    assert_raise(MastermindIllegalContentError){@obj1.declare_answer([3,0])}
    @obj1.get_suggestion()
    assert_raise(MastermindIllegalValueError){@obj1.declare_answer([3,1])}
    assert_raise(MastermindIllegalValueError){@obj1.declare_answer([5,0])}
    assert_raise(MastermindIllegalValueError){@obj1.declare_answer([3,2])}
    assert_raise(MastermindIllegalValueError){@obj1.declare_answer([0,5])}
  end

  #Ob bei einem Vorschlag des Computers ein Array zurueckgegeben wird und dieser die Laenge 2 hat.
  def test_get_suggestion()
    assert_equal([1,1,2,2],@obj1.get_suggestion())
    @obj1.declare_answer([2,0])
    assert_equal([1,1,3,4],@obj1.get_suggestion())
    setup()
    assert_equal([1,1,2,2],@obj1.get_suggestion())
    @obj1.declare_answer([1,2])
    assert_equal([1,2,1,3],@obj1.get_suggestion())
  end

  #Ob ein Error, wenn ein Vorschlag abgefragt wird, wenn schon ein Vorschlag abgefragt wurde, bei dem keine Antwort erfolgt ist, geworfen wird.
  #Ob ein Error geworfen wird, wenn die Antworten es unmoeglich machen, einen Code zu erraten.
  def test_get_suggestion_error()
    @obj1.get_suggestion()
    assert_raise(MastermindIllegalContentError){@obj1.get_suggestion()}
    setup()
    assert_raise(MastermindIllegalContentError){
      for i in 1..3
        @obj1.get_suggestion()
        @obj1.declare_answer([2,2])
      end
      @obj1.get_suggestion()
    }
  end

  #Ob bei won? eine Exception geworfen wird wenn das Spiel noch nicht zu Ende ist.
  def test_won_error()
    refute(@obj1.end?)
    assert_raise(MastermindIllegalContentError){@obj1.won?}
  end

  #Ob das Spiel als gewonnen gilt, wenn der Computer die Kombination herausbekommen hat.
  def test_won_solution()
    @obj1.get_suggestion()
    @obj1.declare_answer([2,0])
    @obj1.get_suggestion()
    @obj1.declare_answer([3,0])
    @obj1.get_suggestion()
    @obj1.declare_answer([2,0])
    @obj1.get_suggestion()
    @obj1.declare_answer([4,0])
    assert(@obj1.won?)
    assert_equal([1,1,3,3],@obj1.solution)
  end

  #Ob beim Versuch des Erhalts einer Loesung ein MastermindIllegalContentError geworfen wird.
  def test_solution_error()
    assert_raise(MastermindIllegalContentError){@obj1.solution()}
  end

  #Ob bei einem veraenderten Spiel der Reset alles zum Anfang zuruecksetzt.
  def test_reset
    @obj1.get_suggestion()
    @obj1.declare_answer([1,0])
    assert_equal(2,@obj1.round)
    @obj1.reset()
    assert_equal(6,@obj1.amount_colors)
    assert_equal(4,@obj1.amount_selection)
    assert_equal(1,@obj1.round)
    assert_equal(false, @obj1.end?())
  end

  #Prueft, ob die Vergleichergebnisse mit denen sich aus den Regeln ergebenden uebereinstimmen.
  def test_compare_array_mastermind()
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
end
