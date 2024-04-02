def f(i, mylist):
  i = i + 1
  mylist.append(0)
  print(i, mylist)

k = 10         # k는 int (immutable)
m = [1,2,3]    # m은 리스트 (mutable)

f(k, m)        # 함수 호출
print(k, m)    # 호출자 값 체크