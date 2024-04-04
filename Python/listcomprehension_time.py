import time
# 시작시간
start = time.time()
start

iteration_max = 100

vector = list(range(iteration_max))
scalar = 2

for _ in range(iteration_max):
    [scalar * value for value in range(iteration_max)]

# 종료시간
end = time.time()

print(end - start)
#0.09794831275939941