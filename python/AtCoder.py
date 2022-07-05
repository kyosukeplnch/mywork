#coding: utf-8

c = 'AtCoder'
S = input()

if S == c:
  print('Yes')
elif S.upper() == c.upper():
  print('Maybe')
else:
  print('No')