a = "hello"
b = ["hello", "python"]
id(a)
id(b)

a = "python2"
id(a)
a = "python3"
id(a)
a = "python3"
id(a)

import sys
print(sys.getsizeof("a"), sys.getsizeof("ab"), sys.getsizeof("abc"))