# Author: Emilie Schuller, Mara von Kroge, 14. November 2017
# TeamChallenger

require 'set'


class Testing
  
 
  
  
  @myhash = {"Auto" => {"Reifen" => 40}}
  #@myhash.merge!({"Auto" => {"Frontscheibe" => 20}})
  @myhash["Auto"]["Reifen"] = 10
  @myhash["Computer"] = {"Reifen" => 5}
  puts @myhash
  puts @myhash["Auto"]["Reifen"]
  

  puts "\n\neach test"
  @myhash.each { |a, b| 
    puts a
    puts b
  }
  puts @myhash
  puts @myhash["Auto"]["Reifen"]
  
end
