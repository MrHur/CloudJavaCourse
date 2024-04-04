items = 'zero one two three four'.split()
print(items)

example = 'python,jquery,javascript' # ","를 기준으로 문자열 나누기
example.split(",")
a, b, c = example.split(",")   #리스트에 잇는 각 값을 a, b, c 변수로 언패킹
print(a,b,c)
example = 'theteamlab.univ.edu'
subdomain, domain, tld = example.split('.')  # "."을 기준으로 문자열 나누기 -> 언패킹
print(subdomain, domain, tld)