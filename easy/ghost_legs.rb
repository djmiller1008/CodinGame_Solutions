picture = []
starting_chars = []
w, h = gets.split(" ").collect { |x| x.to_i }
h.times do |i|
    line = gets.chomp.split("")
    if i == 0 || i == h-1
        line.each do |char|
            if char != " " && i == 0
                starting_chars << char
            end
        end
    end
    picture << line
end

results = []

starting_chars.each_with_index do |starting_char, idx|
    path_index = idx * 3
    h.times do |i|
        right_space = path_index + 1
        left_space = path_index - 1
        if right_space <= w-1
            if picture[i][right_space] == "-"
                path_index += 3
            end
        end

        if left_space >= 0
            if picture[i][left_space] == "-"
                path_index -= 3
            end
        end
    end
    ending_char = picture[h-1][path_index]
    results << starting_char + ending_char
end

puts results