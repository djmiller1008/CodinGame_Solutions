first_pic = []
second_pic = []
f_pos = Hash.new(0)
s_pos = Hash.new(0)

asteroids = []
hash = Hash.new { |h, k| h[k] = [] }
w, h, t1, t2, t3 = gets.split(" ").collect { |x| x.to_i }
output = Array.new(w) { Array.new(h) }
time_lapse = ((t3 - t2).to_f / (t2 - t1).to_f)
time = ((t3 - t2) / time_lapse.to_f)
h.times do
    first_picture_row, second_picture_row = gets.split(" ")
    first_pic << first_picture_row.split('')
    second_pic << second_picture_row.split('')
end

first_pic.each_with_index do |row, i|
    row.each_with_index do |ele, j|
        if first_pic[i][j] != "."
            pos = [i, j]
            f_pos[ele] = pos
            asteroids << ele
        end
    end
end

second_pic.each_with_index do |row, i|
    row.each_with_index do |ele, j|
        if second_pic[i][j] != "."
            pos = [i, j]
            s_pos[ele] = pos
        end
    end
end

a_count = 0
f_pos.each_key do |asteroid|
    x1, y1 = f_pos[asteroid]
    x2, y2 = s_pos[asteroid]
    dx = ((x2 - x1) * time_lapse).floor
    dy = ((y2 - y1) * time_lapse).floor
    nx = (dx + x2)
    ny = (dy + y2)
    n_pos = [nx, ny]
    hash[n_pos] << asteroid
    a_count += 1
end 

output.each_with_index do |row, i|
    row.each_with_index do |ele, j|
        if hash.keys.include?([i, j])
            pos = [i, j]
            output[i][j] = hash[pos].min
        else
            output[i][j] = "."
        end
    end
    output[i] = output[i].join
end

puts output
