# Author:: Mara von Kroge, Emilie Schuller
# 25. November 2017
# TeamChallenger
# Klasse Stack inklusive Exceptions

# Klasse Stack wird erstellt.
class Stack
  def initialize
    
    # Neues Array wird erstellt.
    @stack=Array.new()
  end
  
  # Methode für das Hinzufügen am Ende.
  def push(karte)
    if karte == nil
      begin
    raise ArgumentError, "You aren't allowed to add the Card nil, sorry!"
   #   push(nil)
    rescue ArgumentError => push
      puts "Here's the backtrace for this exception: "
      puts push.backtrace
      puts "And here's the exception object' message: "
      puts push.message
    ensure
  end
    end
  @stack.push(karte) 
end
    
  # Methode für das Entfernen am Anfang.
  def pop
    if @stack.size == 0
  end
    raise ArgumentError, "This Stack is already empty!" 
  begin
  rescue ArgumentError => pop
    puts "Here's the backtrace for this exception:"
    puts pop.backtrace
    puts "And here's the exception object's message:"
    puts pop.message
  ensure
  end
  @stack.pop
end

  # Methode für das Ausgeben des obersten Elementes.
  def peek
    if @stack.size == 0
raise ArgumentError, "This Stack is already empty!" 
    begin
      rescue ArgumentError => peek
        puts "Here's the backtrace for this exception:"
        puts peek.backtrace
        puts "And here's the exception object's message:"
        puts peek.message
      ensure
      end
    end
    @queue.last
  end
  
  # Methode für die Länge des Arrays.
  def length
    @stack.length
  end
  
  # Methode für das Ausgeben des Arrays.
  def to_s
    if @stack.size == 0
    raise ArgumentError, "This Stack already is empty!"
    begin
      rescue ArgumentError => to_s
        puts "Here's the backtrace for this exception:"
        puts to_s.backtrace
        puts "And here's the exception object's message:"
        puts to_s.message
      ensure
      end
   end
    @queue.to_s
  end
  
  
end 