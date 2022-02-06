n = gets.to_i
hash = {
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 0,
    6 => 0,
    7 => 0,
    8 => 0,
    9 => 0
}
n.times do
    transaction = gets.chomp
    nums = transaction.scan(/\d/).join('')
    nums.each_char do |i| 
        i = i.to_i
        if i != 0
            hash[i] += 1
            break
        end
    end
end
n = n.to_f
if !((hash[1] / n) * 100).between?(20.1, 40.1)
    puts true
elsif !((hash[2] / n) * 100).between?(7.6, 27.6)
    puts true
elsif !((hash[3] / n) * 100).between?(2.5, 22.5)
    puts true
elsif !((hash[4] / n) * 100).between?(0, 19.7)
    puts true
elsif !((hash[5] / n) * 100).between?(0, 17.9)
    puts true
elsif !((hash[6] / n) * 100).between?(0, 16.7)
    puts true
elsif !((hash[7] / n) * 100).between?(0, 15.8)
    puts true
elsif !((hash[8] / n) * 100).between?(0, 15.1)
    puts true
elsif !((hash[9] / n) * 100).between?(0, 14.6)
    puts true
else
    puts false
end