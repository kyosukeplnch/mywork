require 'bigdecimal'
n,g,a = gets.split(' ').map(&:to_f)
n1 = (n/2).ceil #切り上げ
n2 = (n/2).floor #切り捨て
max = a / n1
if g < max then
    max = g
end
min = ((a - (n2 * g)) / n1).ceil
if min < 0 then
    min = 0
end
print max.to_i , ' ' , min.to_i