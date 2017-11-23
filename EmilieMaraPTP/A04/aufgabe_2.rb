# Author:: Mara von Kroge, Emilie Schuller, 28. Oktober 2017
# Stack

# Klasse Stack wird erstellt.
class Stack
  def initialize
    
    # Neues Array wird erstellt.
    @stack=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def push(karte)
    raise ArgumentError, "You aren't allowed to add the Card nil, sorry!" unless karte != nil
    
    begin
      push(nil)
    rescue ArgumentError => push
    #  puts push.backtrace
      puts push.message
    ensure
    return self
  end
  end 
    
  # Methode für das Entfernen am Anfang.
  def pop
    raise ArgumentError, "This Stack is already empty!" if @stack.include?(nil)
    @stack.pop
    begin
      @stack.include?(nil)
    rescue ArgumentError => pop
 #     puts pop.backtrace
     puts pop.message
      @stack.pop  
    end 
    return self
  end
  
  # Methode für das Ausgeben des obersten Elementes.
  def peek
raise ArgumentError, "This Stack is already empty!" if @stack.include?(nil)
      @stack.last
      begin
        @stack.empty?(true)
      rescue ArgumentError => peek
   #     puts peek.backtrace
        puts peek.backtrace
      ensure
    end
  end
  
  # Methode für die Länge des Arrays.
  def length
    @stack.length
  end
  
  # Methode für das Ausgeben des Arrays.
  def to_s
    raise ArgumentError, "This Stack already is empty!" if @stack.include?(nil)
    @stack.to_s
    begin
      @stack.empty?(true)
    rescue ArgumentError => to_s
  #    puts to_s.backtrace
      puts to_s.message
    ensure
  end
  end 
  
  # Methode für Empty
  def empty?
   if @stack.empty?
      puts "Dieses Array ist leer, das erste Element wurde entfernt!"
      return true
    else
      puts "Dieses Array ist nicht leer!"
      return false
    end
  end 
  end  