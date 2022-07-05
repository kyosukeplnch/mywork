line = gets.split(' ').map(&:to_i)
ave = 0
line.each do |lines|
  ave += lines
end
ave = ave / line.length
if ave >= 50
  puts "Yes"
else
  puts "No"
end