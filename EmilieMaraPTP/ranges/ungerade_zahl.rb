# Author:: Emilie Schuller
# 07. Januar 2017
# Probeklausurübung - WS 2015

class UngeradeZahl
  def initialize
    puts "Hello! Please enter an odd integer!"
    input = gets.chomp.to_i
    raise ArgumentError, "Please enter an integer!" if !input.instance_of?(Integer)
    raise ArgumentError, "Please enter an integer!" if (input*2) / 2 != input
    if !(input % 2 == 0)
      puts "Thanks!"
    else
      raise ArgumentError, "Please enter an odd integer!"
    end
  end
end

emi = UngeradeZahl.new
