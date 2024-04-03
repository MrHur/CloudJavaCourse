#튜플 반환
def get_info(num, name, phone):
  return num, name, phone
# return이 두개 이상이면 튜플로 반환

a = '1'
b = 'kim'
c = 'apple'

#하나의 변수에 받음
result1 = get_info(a, b, c)
print(f'type(result1) = {type(result1)}')
print(f'result1 = {result1}')

# 일일히 하나씩 받음
d, e, f = get_info(a, b, c)   # 언패킹
print(d)
print(e)
print(f)
