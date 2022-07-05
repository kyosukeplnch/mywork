#coding:utf-8

#一意の値のみ格納するset関数を用意
hit = set()
# n=チーム人数 m=ピンの数
# 入力されたn,mをint型に
n, m = input().split()
n, m = [int(n), int(m)]

# 入力された２列n行の値をそれぞれa,bに格納
ab = [map(int, input().split()) for _ in range(n)]
a, b = [list(i) for i in zip(*ab)]

# p=投げる人 c=ボールが当たるピン i=ピンの番数
# n番目のpがm番目のピンを倒せるかどうか判定
# c(投げたボールがピンに当たる場所)とi(ピンの番数)が一致したらそれをhit変数に入れる
# hit変数に入るiが重複した場合はset関数に基づき削除される
for p in range(n):
  c = p - a[p] - b[p]
  for i in range(m):
    if c == i:
      hit.add(i)

print(len(hit))

