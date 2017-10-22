#Author: Mara von Kroge, Emilie Schuller, 22. Oktober 2017
# TeamChallenger
# Testen

require 'tk'
require_relative 'kreis'
require_relative 'rechteck'
require_relative 'dreieck'

#require_relative 'leinwand'


#meinrechteck = Rechteck.new(200, 200, 500, 200, "gruen")
#meindreieck = Dreieck.new
#meindreieck.sichtbar_machen()
mein_kreis = Kreis.new
mein_kreis.sichtbar_machen(true)
mein_kreis.farbe_aendern('gruen')
mein_kreis.nach_unten_bewegen
mein_kreis.horizontal_bewegen

mein_rechteck = Rechteck.new()
mein_rechteck.sichtbar_machen(true)
mein_rechteck.farbe_aendern('blau')
mein_rechteck.nach_oben_bewegen
mein_rechteck.vertikal_bewegen

mein_dreieck = Dreieck.new()
mein_dreieck.sichtbar_machen(true)
mein_dreieck.farbe_aendern('rot')
mein_dreieck.bewegen_um_punkt()
mein_dreieck.vertikal_bewegen()


#Leinwand erstellen.
=begin
before_action :authorization_method
meine_leinwand = Leinwand.new
meine_leinwand.zeichne_kreis(mein_kreis)
meine_leinwand.erneut_zeichnen()
=end


mein_kreis.zeichnen()