# Author: Mara von Kroge, Emilie Schuller, 15. November 2017
# TeamChallenger
# Klasse Teil - Hash in einem Set

include Enumerable
include Comparable

class Teile
#  @myset = {}
    
  @myset = {"Auto" => {"Autoteile" => {"Reifen" => 40}}}
  @myset.reject!({"Auto" => {"Autoteile" => {"Scheinwerfer" => 8}}})
 p @myset
#    @myset2 = {"Auto" => {"Autoteile" => {"Frontscheibe" => 20}}}
# 
#    p @myset   
# p   @myset.merge!(@myset2)
# 
##@myset.each {|x, y| puts x, y}  #[""] << ["Frontscheibe"]
##    puts @myset["Auto"]["Reifen"]
#  
#  
end 