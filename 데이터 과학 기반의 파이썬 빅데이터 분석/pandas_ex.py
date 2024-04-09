import pandas as pd
pd.__version__
data1 = [10, 20, 30, 40, 50]
data2 = ['1반', '2반', '3반', '4반', '5반']
sr1 = pd.Series(data1)
sr1
sr2 = pd.Series(data2)
sr2
sr3 = pd.Series([101, 102, 103, 104, 105])
sr3
sr4 = pd.Series(['월', '화', '수', '목', '금'])
sr4
sr5 = pd.Series(data1, index = [1000, 1001, 1002, 1003, 1004])
sr5
sr6 = pd.Series(data1, index = data2)
sr6
sr8 = pd.Series(data2, index = sr4)
sr8
sr8[2]
sr8['수']
sr8[-1]
sr8[0:4]
sr8.index
sr8.values
sr1 + sr3
sr4 + sr2

# Pandas - 연습문제
#(1) 임의의 두 개의 시리즈 객체를 만든다.
#    - 모두 문자열 인덱스를 가져야 한다.
#    - 두 시리즈에 공통적으로 포함되지 않는 라벨이 있어야 한다.
#(2) 위에서 만든 두 시리즈 객체를 이용하여 사칙 연산을 한다.

data3 = [1, 2, 3, 4, 5]
data4 = [100, 200, 300, 400, 500]
sr1 = pd.Series(data3)
sr1
sr2 = pd.Series(data4)
sr2
sr3 = pd.Series(data3, index = ['문', '자', '열', '이', '다'])
sr3
sr4 = pd.Series(data4, index = ['이', '다', '거', '빨', '도'])
sr4
sr3 + sr4
sr4 - sr3
sr3 * sr4
sr3 / sr4

import pandas as pd
data_dic = {
  'year': [2018, 2019, 2020],
  'sales': [350, 480, 1099]
}
data_dic
df1 = pd.DataFrame(data_dic)
df1
df2 = pd.DataFrame([[89.2, 92.5, 90.8], [92.8, 89.9, 95.2]], index = ['중간고사', '기말고사'], columns = data2[0:3])
df2
data_df = [['20201101', 'Hong', '90', '95'], ['20201102', 'Kim', '93', '94'], ['20201103', 'Lee', '87', '97']]
df3 = pd.DataFrame(data_df)
df3
df3.columns = ['학번', '이름', '중간고사', '기말고사']
df3.head(2)
df3.tail(2)
df3['이름']

data = {
  "2015": [9904312, 3448737, 2890451, 2466052],
  "2010": [9631482, 3393191, 2632035, 2431774],
  "2005": [9762546, 3512547, 2517680, 2456016],
  "2000": [9853972, 3655437, 2466338, 2473990],
  "지역": ["수도권", "경상권", "수도권", "경상권"],
  "2010-2015 증가율": [0.0283, 0.0163, 0.0982, 0.0141],
  "2005-2010 증가율": [0.0283, 0.0163, 0.0982, 0.0141]
}

columns = ["지역", "2015", "2010", "2005", "2000", "2010-2015 증가율"]
columns = ["지역", "2015", "2010", "2005", "2000", "2005-2010 증가율"]
index = ["서울", "부산", "인천", "대구"]
df = pd.DataFrame(data, index=index, columns=columns)
print(df)

df.values
df.index
df.index.name = "도시"
df.columns.name = "특성"
df
# Update the column named "2010-2015 증가율"
df["2010-2015 증가율"] = df["2010-2015 증가율"] * 100

# Update the column named "2005-2010 증가율" if it exists
if "2005-2010 증가율" in df.columns:
    df["2005-2010 증가율"] = df["2005-2010 증가율"] * 100
else:
    print("Column '2005-2010 증가율' does not exist.")


df["2005-2010 증가율"] = ((df["2010"] - df["2005"]) / df["2005"] * 100).round(2)

print(df)

# 2010이라는 열을 반환하면서 데이터프레임 자료형을 유지
df[["2010"]]
type(df[["2010"]])
# 여러개의 열을 인덱싱하면 부분적인 데이터프레임이 반환된다.
df[["2010", "2015"]]
# "2010-2015 증가율"이라는 이름의 열 삭제
del df["2010-2015 증가율"]
df
#데이터프레임은 전치(transpose)를 포함하여 넘파이 2차원 배열이 가지는 대부분의 속성이나 메서드를 지원 -> 행과 열이 바뀜
df.T