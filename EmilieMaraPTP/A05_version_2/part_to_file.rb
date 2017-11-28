# Author: Emilie Schuller, Mara von Kroge, 28. November 2017
# TeamChallenger
# PartToFile Klasse

require_relative 'Part.rb'

class PartToFile
  
  def write_to_file(teil, filename)
    puts filename
    content = teil.name.to_s << "\n" << teil.parts_amount.to_s << "\n"
    teil.all_parts.each { |a|
      content << a.name.to_s << "\n"
      content << a.mass.to_s << "\n"
      content << a.parent.name.to_s << "\n"
    }
    IO.write(filename, content)
  end
  
  def write_test
    File.write(@name, @parts.flatten.to_s.gsub!(',', "\n").delete('[]" '))
  end
  
  def load_from_file(filename)
    line = IO.readlines(filename)[0]
    @name = line
    line = IO.readlines(filename)[1]
    number_of_parts = line.to_i
    line = IO.readlines(filename)[2]
    words = line.split(/\W+/)
    i = 0
    array = 0
    while (i < number_of_parts)
      @parts[words[array]] = (@parts[words[array + 1]].to_f)
      i = i+1
      array = array + 2
    end
  end
end