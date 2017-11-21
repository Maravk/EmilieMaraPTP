# Author: Emilie Schuller, Mara von Kroge, 20. November 2017
# TeamChallenger
require 'yaml'
 
class Teil_Mara
  include Enumerable
  include Comparable 
  
  # schreibt den hash in einer yaml datei
  def liste_speichern
    File.write('A05/liste.yml', @myhash.to_yaml)
  end
  
  # liest den hash aus einer yaml datei
  def liste_laden
    @myhash = YAML.load_file('A05/liste.yml')
  end

  # initialize
  # neuer Hash, welcher widerum aus einem Hash besteht, dessen value wieder ein Hash ist.
  def initialize()
    @myhash = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
  end
  
  # Methode zum Hinzufügen eines Ganzen zum Hash.
  def add_ganzes(ganzes)
    if !@myhash.include?(ganzes)
      @myhash[ganzes]
    end
  end
  
  # Methode zum Hinzufügen eines Teils zum Hash.
  def add_teil(ganzes, teil)
    @myhash[ganzes][teil]
  end 
  
  # Methode zum Hinzufügen eines Teils zum Ganzen inkl. seiner Masse.
  def add_teil_und_masse(ganzes, teil, masse)
    @myhash[ganzes][teil][masse]
  end
  
  # Methode zum Hinzufügen eines Einzelteils zu Teil inkl. seiner Masse.
  def add_teil_zu_teil_und_masse(teil, teil_davon, masse)
    @myhash.each do |key, value|
     if key == teil
       value.each do |key2, value2|
     end
   end
  
   
  # Teile von Teil werden in einem Array ausgegeben.
  def gib_teile_von_teil(teil)
    @myhash.each do |key, value|
      if key == teil
        return value
      end
    end
    liste = []
      value.each do |key2, value2|
        liste << value2
      end
      return liste
    end
  end
  
  
  # Insgesamte Masse
  # Sofern diese 0 ist, wird 0 zurückgegeben.
  def gib_masse_vom_ganzen(ganzes)
    masse = 0
     
    @myhash[ganzes].each do |key, value|
      value.each do |key2, value2|
        masse += key2
      end
    end
    return masse
  end

  # Gibt das Ganze eines Teils zurück
  def gib_top(teil)
    @myhash.each { |parent|
      @myhash.values.any? { |v| 
      v == teil
      return parent
      }
    }
  end

  # myHash wird ausgegeben.
  def schreib_hash
    return @myhash
  end
  
#  #fehlerhaft
  def return_teile(ganzes)
    list = []
    @myhash[ganzes].each do |a|
      list << a
end 
  end
  
  def return_einzelteile(teil)
    list = []
      @myhash[teil].each do |a|
        list << a
  end
end
  
  # Test der return-Funktion.
  def return_teile_2(ganzes)
    return @myhash[ganzes].values
  end

end
end

#skript

# Neues Objekt der Klasse.
my_list = Teil_Mara.new

# Zwei neue Ganze werden hinzufgefügt.
my_list.add_ganzes("Auto")
my_list.add_ganzes("Computer")
puts "Das Ganze namens Auto sowie das Ganze\nnamens Computer wurden hinzugefügt."
#my_list.schreib_hash
puts ''
# Zu den Ganzen werden Teile hinzugefügt.
my_list.add_teil("Computer", "CPU")
my_list.add_teil("Auto", "Reifen")
puts "Zu dem Ganzen Computer wurde das Teil CPU\nhinzugfügt und zu dem Ganzen Auto das Teil Reifen."
puts ''

# Zu den Ganzen werden Teile inklusive Masse hinzugefügt.
my_list.add_teil_und_masse("Auto", "Scheibe", 7000)
my_list.add_teil_und_masse("Computer", "GPU", 230.1)
my_list.add_teil_und_masse("Computer", "PSU", 480)
my_list.add_teil_und_masse("Computer","CD_Laufwerk", 850)
puts''
my_list.add_teil_zu_teil_und_masse("CPU", "Akkumulator" , 10)
#my_list.schreib_hash

# Alle Teile des Computers werden ausgegeben.
puts "Das Ganze Computer besitzt die folgenden Teile: " + my_list.return_teile("Computer").to_s
puts "Das Ganze Computer beistzt die folgenden Einzelteile: " + my_list.return_teile_2("Computer").to_s
list = my_list.gib_teile_von_teil("Computer")
puts "Gib Teile von Teil: \n" + list.flatten.uniq.to_s + "\n"
puts''

# Gesamtmasse von Computer wird hinzugefügt.
masse = my_list.gib_masse_vom_ganzen("Computer")
puts "Die Gesamtmasse des Computers beträgt #{masse.to_s} Kilogramm."
puts''

my_list.liste_speichern()
my_list.add_ganzes("Käse")
my_list.liste_laden()
my_list.schreib_hash()

puts "Das erste Teil von Computer ist: " + my_list.gib_top("Computer").to_s + "\n"
puts "Test Return Funktion: " + my_list.return_einzelteile("Computer").to_s + "\n" 