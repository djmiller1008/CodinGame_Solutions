l = gets.to_i
h = gets.to_i
t = gets.chomp
art = []
h.times do
    row = gets.chomp
    art << row
end

(0...h).each do |i|
    t.each_char do |char|
        if char >= 'a' && char <= 'z'
            x = char.ord - 'a'.ord
        elsif char >= 'A' && char <= 'Z'
            x = char.ord - 'A'.ord
        else
            x = 'z'.ord - 'a'.ord + 1
        end

        (0...l).each do |j|
            print art[i][x * l + j]
        end
    end
    puts
end