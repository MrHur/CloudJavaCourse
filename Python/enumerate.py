for i, v in enumerate(['tic', 'tac', 'toe']):
  print(i, v)


enu = {i:j for i,j in enumerate('TEAMLAB is an academic institute located in South Korea.'.split())}
print(enu)

# enumerate 함수
data = enumerate((1, 2, 3))
print(data, type(data))

for i, value in data:
  print(i, ":", value)
  print()

data = enumerate({1, 2, 3})
for i, value in data:
  print(i, ":", value)
print()

data = enumerate([1, 2, 3])
for i, value in data:
  print(i, ":", value)
print()

dict1 = {'이름': '한사람', '나이': 33}
data = enumerate(dict1)
for i, key in data:
  print(i, ":", key, dict1[key])
print()

data = enumerate("재미있는 파이썬")
for i, value in data:
  print(i, ":", value)
print()

alist = ['a1', 'a2', 'a3']
blist = ['b1', 'b2', 'b3']
for a, b in zip(alist, blist):
  print(a, b)

a, b, c = zip((1, 2, 3), (10, 20, 30), (100, 200, 300))
print(a, b, c)
result = [sum(x) for x in zip((1, 2, 3), (10, 20, 30), (100, 200, 300))]
print(result)

alist = ['a1', 'a2', 'a3']
blist = ['b1', 'b2', 'b3']
for i, (a, b) in enumerate(zip(alist, blist)):
  print(i, a, b)