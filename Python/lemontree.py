a = open("lemontree.txt", 'r')
lemontree_lyric = a.readlines()
a.close()

contents = ""
for line in lemontree_lyric:
    contents = contents + line.strip() + "\n"

n_of_lemon = contents.upper().count("LEMON")
n_of_blue = contents.upper().count("BLUE")
n_of_Iam = contents.upper().count("I'M")
print("Number of a Word 'lemon'" , n_of_lemon)
print("Number of a Word 'blue'" , n_of_blue)
print("Number of a Word 'I'm'" , n_of_Iam)


'''
with open("lemontree.txt", "r") as file: # 파일을 읽기 모드로 열기
    contents = file.read()     # 파일 내용을 읽어와서 출력
    print(contents)
'''