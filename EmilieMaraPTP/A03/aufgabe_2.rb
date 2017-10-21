#Author:: Emilie Sarina Schuller, Mara von Kroge, 18.Oktober 2017
#IBAN

class Aufgabe_2
  def initialize(bankleitzahl, kontonummer)
    #@laenderkennung = laenderkennung
    @b = bankleitzahl
    @k = kontonummer
  end

  def berechnung
    pruefziffer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    k = @k
    b = @b
    pruefziffer[0] = k[0]
    pruefziffer[1] = k[1]
    pruefziffer[2] = k[2]
    pruefziffer[3] = k[3]
    pruefziffer[4] = k[4]
    pruefziffer[5] = k[5]
    pruefziffer[6] = k[6]
    pruefziffer[7] = k[7]
    pruefziffer[8] = k[8]
    pruefziffer[9] = k[9]
    pruefziffer[10] = k[0]
    pruefziffer[11] = b[1]
    pruefziffer[12] = b[2]
    pruefziffer[13] = b[3]
    pruefziffer[14] = b[4]
    pruefziffer[15] = b[5]
    pruefziffer[16] = b[6]
    pruefziffer[17] = b[7]
    pruefziffer[18] = 1
    pruefziffer[19] = 3
    pruefziffer[20] = 1
    pruefziffer[21] = 4
    pruefziffer[22] = 0
    pruefziffer[23] = 0

    #puts pruefziffer[0..17].each + " 1314 00"

    pruefziffer1 = [0,0,0,0,0,0,0,0]
    
    pruefziffer.each_index { |index|
      pruefziffer1[index] = pruefziffer[index] if index <= 7
    }
    
    division = pruefziffer1[0..7].to_i % 97

    block1 = division + pruefziffer[0..9]

    division3 + pruefziffer[9..15].to_i = pruefziffer2
    division3 = ((pruefiffer2/97)).to_i
    division4 = (division3*97).to_i

    block2 =  division4 + pruefziffer[9..15]

    divsision4 + pruefziffer[16..22].to_i = pruefziffer3
    division5 = ((pruefziffer3/97)).to_i
    division6 = (division5+97).to_i

    block3 = division6 + pruefziffer[16...22]

    division6 + pruefziffer[23].to_i = pruefziffer3
    division7 = ((pruefziifer3/97)).to_i
    division8 = (division7+97).to_i

    puts (89 - division8).to_i = fertige_pruefziffer

    if fertige_pruefziffer < 10
      then puts "0" + fertige_pruefziffer

      puts "Ihre Prüfziffer lautet: #{fertige_pruefziffer} und Ihre IBAN lautet nun: DE + #{fertige_pruefziffer} + #{pruefziffer[0..17]}!"

    end
  end

end

