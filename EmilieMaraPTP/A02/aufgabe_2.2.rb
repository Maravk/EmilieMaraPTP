#Author: Emilie Sarina Schuller, Mara von Kroge
#Fibonacci-Folge
  #Variante 2.2

def fibo(n)
e = 0
f = 1

n.times do
  temp = e
  e = f
  f = temp + e
end

return e
end 

10.times do |n|
  total = fibo(n)
  puts total
end