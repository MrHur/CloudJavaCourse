print("구구단 몇 단을 계산할까?")
dan = int(input())
print("구구단 " + str(dan) + "단을 계산한다." )  # 문자열과 정수를 결합하기 위해 정수를 문자열로 변환합니다.
for i in range(1, 10):
    result = dan * i
    print(str(dan) + " x " + str(i) + " = " + str(result))