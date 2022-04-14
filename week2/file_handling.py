with open("file1.txt","r+") as myfile:
   print(myfile.write("Actually I was "))
   print(myfile.read())
   
myfile.close()

