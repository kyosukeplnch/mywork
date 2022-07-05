n = gets.to_i
a = gets.split(' ').map(&:to_i)
sum = 0
tsum = 0
a.each do |i|
    tsum += i
    if sum <= tsum
        sum = tsum
    end
    if tsum < 0
        tsum = 0
    end
end
if sum == 0
    p a.max
else
    p sum
end
