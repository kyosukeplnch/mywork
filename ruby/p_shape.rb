# x,y入力
x,y = gets.split(" ").map(&:to_i)

# 変数一覧(rubyには宣言がない)
# 長さ
# x = 5
# 高さ
# y = 3
# 角を除いた長さ(horizontal)
h = x - 2
# 角を除いた高さ(vertical)
v = y - 2
# x方向の長さ
len_X = 0
# y方向の長さ
len_Y = 0

# x,yが０以下の時は何も出力しない(エラー対策)
if x <= 0 || y <= 0 then
  exit
end

# x上段を出力
if x == 1 then
  print("o\n")
else
  print("o")
  h.times do
    print("-")
    len_X += 1
  end
  print("o\n")
end
# y == 1のときはx1行なので処理終了
if y == 1 then
  exit;
end

# y中段を出力
v.times do
  # x == 1のときはy1行なのでv分の|のみを出力
  if x == 1 then
    print("|\n")
  else
    print("|")
    len_Y = 0
    while len_Y < h
      print(" ")
      len_Y += 1
    end
    print("|\n")
  end
end

# x下段を出力
# y != 1でx == 1のときはoのみ出力して処理終了
if x == 1 then
  print("o")
  exit
else
  print("o")
  len_X = 0
  while len_X < h 
    print("-")
    len_X += 1
  end
  print("o\n")
end