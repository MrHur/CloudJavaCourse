import math

str_input = input("원의 반지름 입력> ")
radius = float(str_input)

circ = round(2 * math.pi * radius, 2)  # 둘레를 소수점 둘째 자리에서 반올림
area = round(math.pi * radius ** 2, 2)  # 넓이를 소수점 둘째 자리에서 반올림

print("반지름:", radius)
print("둘레:", circ)
print("넓이:", area)