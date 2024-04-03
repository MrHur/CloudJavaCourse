a = (38, 21, 53, 62, 19, 53)
a.index(53)

a = (10, 20, 30, 15, 20, 40)
a.count(20)


a = (38, 21, 53, 62, 19)
for i in a:
    print(i, end=' ')


a = tuple(i for i in range(10) if i % 2 == 0)
a