# Author: Emilie Schuller, Mara von Kroge, 14. November 2017
# TeamChallenger

require 'set'


class Testing
  
 
  
  
  @myhash = {"Auto" => {"Reifen" => 40}}
  #@myhash.merge!({"Auto" => {"Frontscheibe" => 20}})
  @myhash["Auto"]["Reifen"] = 10
  @myhash["Computer"] = {"Prozessor" => 5}
  puts @myhash
  puts @myhash["Auto"]["Reifen"]
  @myhash["Auto"] = {"Reifen" => {"Gummi" => 10}} 
  
  puts "\n\neach test"
  @myhash.each { |a, b| 
    puts a
    puts b
  }
  puts @myhash
  puts @myhash["Auto"]["Reifen"]

  
  puts @myhash["Auto"].size
  puts @myhash["Computer"].size
  puts @myhash["Auto"]["Reifen"]["Gummi"] = {"Radkappen" => 20}
    puts @myhash["Auto"]
    
   puts @myhash["Computer"].to_a
     
     puts @myhash["Auto"]["Reifen"]["Gummi"].to_s
       
       puts @myhash.to_s
       
  @myhash["Computer"].update({"Graka" => 10})
         puts @myhash["Computer"]
end
