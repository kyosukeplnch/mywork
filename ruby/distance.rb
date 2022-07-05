x,y = gets.split(' ').map(&:to_f)
p,q = gets.split(' ').map(&:to_f)
if x/2 < p
    x = 0
end
if y/2 < q
    y = 0
end
ans = ((x-p)**2 + (y-q)**2) **(1/2.0)
p ans