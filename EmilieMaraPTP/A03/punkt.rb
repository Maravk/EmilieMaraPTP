# Klasse, deren Objekte Punkte in der Ebene repräsentieren.
# Author:: Birgit Wendholt
# Author:: Bernd Kahlbrandt, an Ruby Style Guide angepasst.
class Punkt
  def initialize(x,y)
    @x = x
    @y = y
  end

  def x
    return @x
  end

  def y
    return @y
  end

  def + (punkt)
    return Punkt.new(@x+punkt.x,@y+punkt.y)
  end

  def to_s()
    return "Punkt(#@x,#@y)"
  end
end