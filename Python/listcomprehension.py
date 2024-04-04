# 일반적인 반복문 + 리스트
result = [ ]
for i in range(10):
  result.append(i)

  result

# 리스트 컴프리 헨션
result = [i for i in range(10)]
result

# 두 결과 값이 같음


# 리스트 컴프리헨션의 사용법

# 지정된 범위 내에서 짝수만 저장
result = [i for i in range(10) if i % 2 == 0]
result

# 2의 배수일 때는 2의 배수의 값을, else 라면 10을 입력함.
result = [i if i % 2 == 0 else 10 for i in range(10)]
result

# 중첩 if문
result = [x for x in range(10) if x < 5 if x % 2 == 0]
result


# 중첩 반복문
word_1 = 'Hello'
word_2 = 'World'
result = [i + j for i in word_1 for j in word_2]
result

# 중첩 반복문(nested loop)
result = [(x, z, y) for x in ['쌈밥', '치킨', '피자'] for y in ['사과', '아이스크림', '커피'] for z in ['배달 시키기', '가서 먹기']]
result

# 이차원 리스트(two-dimensional list)
words = 'The quick brown fox jumps over the lazy dog'.split()
print(words)
stuff = [[w.upper(), w.lower(), len(w)] for w in words]
print(stuff)

# 일차원 리스트가 만들어짐
case_1 = ["A", "B", "C"]
case_2 = ["D", "E", "A"]
result = [i + j for i in case_1 for j in case_2]
result

# 이차원 리스트이 만들어짐
result = [[i + j for i in case_1] for j in case_2]
result

