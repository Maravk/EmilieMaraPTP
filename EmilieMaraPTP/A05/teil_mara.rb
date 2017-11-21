# Author: Emilie Schuller, Mara von Kroge, 20. November 2017
# TeamChallenger
require 'yaml'
 
class Teil_Mara
  include Enumerable
  include Comparable 

 
  
  # write hash out as a YAML file
  def liste_speichern
    File.write('A05/liste.yml', @myhash.to_yaml)
  end
  
  # read back in from file
  def liste_laden
    @myhash = YAML.load_file('A05/liste.yml')
  end

  
  def initialize()
    @myhash = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
  end
  
  def add_ganzes(ganzes)
    if !@myhash.include?(ganzes)
    @myhash[ganzes]
    end
  end
  
  def add_teil(ganzes, teil)
    @myhash[ganzes][teil]
  end
  
  def add_teil_und_masse(ganzes, teil, masse)
    @myhash[ganzes][teil][masse]
  end
  
  #def add_teil_zu_teil_und_masse(teil, teil_davon, masse)
   # @myhash.each do |key, value|
    # if key == teil
     #  value.each do |key2, value2|
    # end
   #end
  
  def gib_teile_vom_ganzen(ganzes)
    liste = []
     
    @myhash[ganzes].each do |key, value|
      value.each do |key2, value2|
        liste << value2
      end
    end
    return liste
  end
  
  # noch nicht fertig
  def gib_masse_vom_ganzen(ganzes)
    masse = 0
     
    @myhash[ganzes].each do |key, value|
      value.each do |key2, value2|
        masse += key2
      end
    end
    return masse
  end
     
  def gib_oberes
    
  end

  def schreib_hash()
    puts @myhash
  end
  
  #fehlerhaft
  def return_teile(ganzes)
    @myhash[ganzes].each { |a|
      puts a
    }
  end

end

my_list = Teil_Mara.new
my_list.add_ganzes("Auto")
my_list.add_ganzes("Computer")
my_list.schreib_hash()
my_list.add_teil("Computer", "CPU")
my_list.add_teil("Auto", "Reifen")
my_list.add_teil_und_masse("Computer", "GPU", 230.1)
my_list.add_teil_und_masse("Computer", "PSU", 480)

my_list.schreib_hash
puts
my_list.return_teile("Computer")
puts "returned teile\n"

list = my_list.gib_teile_vom_ganzen("Computer")
puts list.flatten.uniq

masse = my_list.gib_masse_vom_ganzen("Computer")
puts "Masse von Computer: " + masse.to_s

my_list.liste_speichern()
my_list.add_ganzes("Käse")
my_list.liste_laden()
my_list.schreib_hash()
