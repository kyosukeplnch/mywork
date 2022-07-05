
# require 'Math'
n = gets.chomp.to_i
start = Time.now
# def fact(n)
#   if n == 0
#     1
#   else
#     n * fact(n-1)
#   end
# end
# def fact(n)
#   return 1 if n == 0
#   n * fact(n-1)
# end

ans = (1..n).inject(:*)

puts ans.to_s.length

en = Time.now

tim = en - start
puts tim