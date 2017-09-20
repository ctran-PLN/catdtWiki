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
