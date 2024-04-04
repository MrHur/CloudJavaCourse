ex = [1, 2, 3, 4, 5]
f = lambda x: x ** 2
print(list(map(f, ex)))

a = map(int, input().split())
print(list(a))

ex = [1, 2, 3, 4, 5]
f = lambda x, y: x + y
list(map(f, ex, ex))

ex = [1, 2, 3, 4, 5]
f = [x + y for x, y in zip(ex, ex)]
print(f)

ex = [1, 2, 3, 4, 5]
hey = list(map(lambda x: x ** 2 if x % 2 == 0 else x, ex))   # map() 함수
print(hey)
hey2 = [x ** 2 if x % 2 == 0 else x for x in ex] # 리스트 컴프리헨션
print(hey2)