class Ruleset
  def initialize(pc_maker, pc_solver, color_amount = 6, pick_amount = 4, multi_select = true)
    if color_amount < pick_amount && !multi_select
      raise Argumend
    end
  end
  
  @pc_maker = pc_maker
  @eee
  
  def pc_maker?
    @pc_maker
  end
  
  def pc_solver?
    @pc_solver
  end
  
  def color_amount?
    @color_amount
  end
  
  
  
  def self.from_user()
    # abfrage vom user, ob pc sich die kombi ausdenken soll
    # soll der pc lösen?
    # möchte man die regeln änern?
    
    retrun RuleSet.new(auto_generate, atuo_solve) unless ans #answer
  end
end