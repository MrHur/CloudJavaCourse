# 리스트를 튜플로
a1 = [1, 3, 5, 7, 9, 11]
a2 = tuple(a1)

print(f'tuple(리스트) = {a2}')

# 문자열을 튜플로
b1 = "BlockDMask"
b2 = tuple(b1)

print(f'tuple(문자열) = {b2}')

# 딕셔너리를 튜플로
c1 = {'name': 'blockdmask', 'phone': '010-1234-1234', 'phone_type': 'galaxy'}
c2 = tuple(c1)
c3 = tuple(c1.values())

print(f'tuple(딕셔너리) = {c2}')
print(f'tuple(딕셔너리,values()) = {c3}')
