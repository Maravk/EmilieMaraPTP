# Author: Emilie Schuller, Mara von Kroge, 14. November 2017
# TeamChallenger

require 'set'


class Teile
  
 
  
  
  @myhash = {"Auto" => {"Reifen" => 40}}
  @myhash.merge!({"Auto" => {"Frontscheibe" => 20}})
  puts @myhash
  puts @myhash["Auto"]["Reifen"]
  
  @myhash.each { |a, b| 
    puts a
    puts b
  }
    
  
end
