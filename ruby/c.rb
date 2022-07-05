require 'set'
nms = gets.split(' ').map(&:to_i)
a = gets.split(' ').map(&:to_i).sort
b = gets.split(' ').map(&:to_i)
b = Set[*b]
count = 0
c = 0
ans = 0
for i in a do
    c = nms[2] - i
    ans = b.include?(c)
    if ans == true
        count += 1
    end
end

puts count
