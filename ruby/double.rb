x,a = gets.split(' ').map(&:to_f)
ans = 0
if x != 0 then
    until x%a == 0 do
        if x%a < (a/2)
            x -= 1
        else
            x += 1
        end
        ans += 1
    end
end
p ans
