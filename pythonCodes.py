a = [1,2,3,4,5,6]
def rotateL(al, m):
  n = len(al)
  b = [0] * n
  for i in range(n):
    b[i] = al[(i+m) % n]
  print('Rotate Left:')  
  print(b)
def rotateR(al, m):
  n = len(al)
  b = [0] * n
  for i in range(n):
    b[i] = al[(i-m+n) % n]
  print('Rotate Right:') 
  print(b)
print(a)  
rotateL(a,2)
rotateR(a,2)


#Pandas
#Convert Series month string to numeric
monthStr
->JAN
->FEB
->MAR
->...
->DEC
#create a dictionary for the months
monums={'JAN':'1', 'FEB':'2', 'MAR':'3', 'APR':'4', 'MAY':'5', 'JUN':'6', 'JUL':'7', 'AUG':'8', 'SEP':'9', 'OCT':'10', 'NOV':'11','DEC':'12'}
#month
monos=monthStr.map(monums)

