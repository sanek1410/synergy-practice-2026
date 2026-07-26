from array import *

a = array('i', [4, -3, 9, 2, -5, -7, -1])

max_index = a.index(max(a))
min_index = a.index(min(a))

left = min(max_index, min_index)
right = max(max_index, min_index)

result = 0
for i in range(left + 1, right):
    if a[i] < 0:
        result += a[i]

print("Массив:", a)
print("Сумма отрицательных элементов:", result)
