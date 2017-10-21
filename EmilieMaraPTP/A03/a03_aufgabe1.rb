require 'tk'
require_relative 'rechteck'
require_relative 'kreis'
require_relative 'leinwand'


#meinrechteck = Rechteck.new(200, 200, 500, 200, "gruen")
#meindreieck = Dreieck.new
#meindreieck.sichtbar_machen()
mein_kreis = Kreis.new
mein_kreis.sichtbar_machen()

meine_leinwand = Leinwand.new
meine_leinwand.zeichne_kreis(mein_kreis)
meine_leinwand.erneut_zeichnen()



mein_kreis.zeichnen()