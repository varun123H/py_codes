def fibo(n):
    if n<2 :
        return n
    else:
        return fibo(n-1) + fibo(n-2)
a = input("enter n")
n = int(a)
result = fibo(n)
print(result)
