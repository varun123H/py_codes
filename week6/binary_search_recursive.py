def Binary(L, find, start, end):

    mid = int((start+end)/2)

    if(start == end):
        if(L[end] == find):
           return end
        else:
           return -100
    if(L[mid] == find):
         return mid

    elif(find > L[mid]):
        return Binary(L, find, mid + 1, end)
    else:
        return Binary(L, find, start, mid-1)
L = [1,2,3,4,5,6,7,8]
find = 6
start = 0
end = len(L)-1
print(Binary(L,find,start,end))