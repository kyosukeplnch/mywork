n,m = gets.split(' ').map(&:to_i)
a = gets.split(' ').map(&:to_i)
bc= []
while line = gets
    bc << line.chomp.split(' ').map(&:to_i)
end
x = [] #整数列x
ans = 50 #罰金の最大値
#3進数n桁をx_pに配列にして格納
for i in 0..(3**n-1) do
    i = i.to_s(3).split('')
    while i.size < n do #n桁でない場合、n桁になるまで0を追加
        i.insert(0,"0")
    end
    i = i.map(&:to_i) #3進数を文字列から整数に変換
    count = 0
    for j in 0..n-1 do
        if i[j] <= a[j] then #iがa以下かどうかの判断
            count += 1
        end
    end
    if count == n then #count=nならば整数列xに追加
        x.push(i)
    end
end
x.each do |i| #xを1つずつ取り出す
    fine = 0
    bc.each do |j| #bcを1つずつ取り出してそれぞれをb/cに格納して-1しておく
        b = j[0] - 1
        c = j[1] - 1
        if i[b] == i[c] then #xb=xcなら罰金を1円科す
            fine += 1
        end
    end
    if fine <= ans then #より少ない罰金額をansに格納
        ans = fine
    end
end
p ans