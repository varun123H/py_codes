def fizzbuzz():
    for i in range(1,31):
        if (i%3 ==0 and i%5 ==0):
            print("fizzbuzz")
        else:
            if(i%3 == 0):
                print("fizz")
            else:
                if(i%5 == 0):
                    print("buzz")
            
    
    
    
    
fizzbuzz()