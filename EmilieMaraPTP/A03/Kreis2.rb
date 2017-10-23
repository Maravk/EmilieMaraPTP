require 'v1_Geometrie/Point'

class Kreis2
  
  def initialize(radius,mittelpunkt)
    @radius = radius
    @mittelpunkt = mittelpunkt
    @umfang 
    @inhalt 
  end
  
  def umfang()
      if (@umfang)
        return @umfang
      else 
        @umfang = 2 * Math::PI * @radius
        return @umfang
      end    
  end
end