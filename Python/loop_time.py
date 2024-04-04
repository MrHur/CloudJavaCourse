import time

# 시작시간
start = time.time()
start

def sclar_vector_product(scalar, vector):
    result = []
    for value in vector:
        result.append(scalar * value)
    return result

iteration_max = 100

vector = list(range(iteration_max))
scalar = 2

for _ in range(iteration_max):
    sclar_vector_product(scalar, vector)

    # 종료시간
end = time.time()

print(end - start)  
# 0.1651155948638916
