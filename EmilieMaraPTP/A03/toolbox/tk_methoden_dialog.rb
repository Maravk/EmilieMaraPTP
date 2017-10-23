# Ein Eingabedialog für die Eingabe eines Wertes
# Author:: Birgit Wendholt
# Author:: Bernd Kahlbrandt, an Ruby Style Guide angepasst, yard verwendet.
class TkMethodenDialog < TkToplevel
  $OK = 'Ok'
  $CANCEL = 'Abbrechen'
  
  def initialize(parent,toolbox, instanz, instanz_symbol, methoden_name, &block)
      super(parent, &block)
      entries = []
      row = 0
      my_parent = self
      instanzen_liste = []
      labels_and_types = $METHOD_CONFIG[instanz_symbol][methoden_name][ :args]
      labels_and_types.each do |label_and_type|
         label_name = label_and_type[0]
         type = label_and_type[1]
         Tk::Tile::Label.new(self) {text label_name}.grid(:column => 0, :row => row, :sticky => "nswe")
         entry_var = TkVariable.new(instanz)        
         if toolbox.klassen.include?(type)
           instanzen_liste = toolbox.instanzen_liste(Kernel.const_get(type))     
           entry =  Tk::Tile::Combobox.new(self) {
             state :readonly
            }.grid(:column => 0, :row => row)
           entry.values(instanzen_liste) 
         else
           entry = Tk::Tile::Entry.new(self).grid( :column => 1, :row => row)             
         end
         entries << entry
         row +=1   
      end      
      Tk::Tile::Button.new(self) {text $OK
               command proc { 
                   entry_vals  = [];
                   i = 0;
                   entries.each_index{|index|
                     entry = entries[index]
                     type = labels_and_types[index][1] 
                     if type == :String
                       entry_vals << entry.get() 
                     elsif type == :Integer
                       entry_vals << Integer(entry.get()) 
                     elsif type == :Float
                       entry_vals << Float(entry.get())
                     else 
                       if entry.current() >= 0
                          entry_vals << instanzen_liste[entry.current()]
                       else entry_vals << nil
                       end
                     end}  
                     ein_objekt = instanz.method(methoden_name).call(*entry_vals)
                     if instanz.is_a? Class
                         toolbox.instanz_hinzufuegen(ein_objekt)                       
                     end  
                     my_parent.destroy
                  } 
           }.grid(:column => 0, :row => row)
            Tk::Tile::Button.new(self) {text $CANCEL
               command proc { 
                   my_parent.destroy
                  } 
            }.grid(:column => 1, :row => row)

    end
    
end
