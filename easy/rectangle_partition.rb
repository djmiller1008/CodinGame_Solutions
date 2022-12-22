w, h, count_x, count_y = gets.split(" ").collect { |x| x.to_i }
w_meas = [0, w]
h_meas = [0, h]
count = 0
inputs = gets.split(" ")
for i in 0..(count_x-1)
    x = inputs[i].to_i
    w_meas << x
end
inputs = gets.split(" ")
for i in 0..(count_y-1)
    y = inputs[i].to_i
    h_meas << y
end

w_lines = []
h_lines = []

w_meas.each_with_index do |meas, i|
    (i + 1...w_meas.length).each do |j|
        w_lines << (w_meas[i] - w_meas[j]).abs
    end
end

h_meas.each_with_index do |meas, i|
    (i + 1...h_meas.length).each do |j|
        h_lines << (h_meas[i] - h_meas[j]).abs
    end
end

w_lines.each do |line|
    count += h_lines.count(line)
end

puts count
