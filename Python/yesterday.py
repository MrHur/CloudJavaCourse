f = open("yesterday.txt", 'r')
yesterday_lyric = f.readlines()
f.close()

contents = ""
for line in yesterday_lyric:
    contents = contents + line.strip() + "\n"

n_of_yesterday = contents.upper().count("YESTERDAY")
print("Number of a Word 'Yesterday'" , n_of_yesterday)


# 파일을 읽기 모드로 열기
with open("yesterday.txt", "r") as file:
    # 파일 내용을 읽어와서 출력
    contents = file.read()
    print(contents)