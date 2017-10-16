
def fibo(n)
  n <= 2 ? 1 : fibo(n-1) + fibo(n-2)
end

puts fibo(100)