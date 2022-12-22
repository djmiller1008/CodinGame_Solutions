f  = []
b  = []
current = 0
n  = gets.to_i
start = nil
(1..n).each do |i|
    line = gets.chomp
    f << i if line.include?('Fizz')
    b << i if line.include?('Buzz')
    if start == nil && line.to_i != 0
        current = line.to_i
        start = current - i
    end
end

if f.length == 1
    fizz = f[0] + start
else
    fizz = f[1] - f[0]
end

if b.length == 1
    buzz = b[0] + start
else
    buzz = b[1] - b[0]
end

puts [fizz, buzz].join(" ")