# reduce() 함수

from functools import reduce
print(reduce(lambda x, y: x+y, [1, 2, 3, 4, 5]))

import functools

num_list = [3, 2, 8, 1, 6, 7]
max_num = functools.reduce(lambda x, y: x if x > y else y, num_list)
print(max_num)         # 8 출력

# 별표의 언패킹 기능
def asterisk_test(a, args):
  print(a, *args)
  print(type(args))

  asterisk_test(1, (1, 2, 3, 4, 5, 6))

  def asterisk_test(a, b, c, d,):
    print(a, b, c, d)

  data = {"b":1, "c":2, "d":3}
  asterisk_test(10, **data)