nm = gets.split(' ').map(&:to_i)
count = 0
p = nm[0]
if nm[0] == nm[1]
  puts "1"
elsif nm[0] > nm[1]
  puts "0"
else
  while p <= nm[1]
    p = p * nm[0]
    count += 1
  end
  puts count
end