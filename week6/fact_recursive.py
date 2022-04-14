def fact(n):
    if(n==1):
        return(1)
    elif(n>1):
        return(n*fact(n-1))
    else:
         print("Invalid n")
n=5
b = fact(n)
print(b)