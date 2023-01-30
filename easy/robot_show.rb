l = gets.to_i
n = gets.to_i
duct = []
inputs = gets.split(" ")
pos = []
for i in 0..(n-1)
    b = inputs[i].to_i
    pos << b
end

max = pos.max
min = pos.min

max = [l - min, max].max

puts max