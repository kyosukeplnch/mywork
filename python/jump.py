# coding: utf-8

i = input().split()

w = int(i[0])
k = int(i[1])
d = int(i[2])

if d < k:
  print('No')
elif d < w - k:
  print('No')
else:
  print('Yes')