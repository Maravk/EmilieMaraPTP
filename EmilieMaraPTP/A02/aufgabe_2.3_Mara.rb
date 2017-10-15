
n = 0
gets.chomp n
n = n.to_i

def fibo(n)
  n <= 2 ? 1 : fibo(n-1) + fibo(n-2)
end