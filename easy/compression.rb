third_row = []
w = gets.to_i
h = gets.to_i
t = gets.chomp.split(" ")

fax = Array.new(h) { Array.new(w, " ") }

t.each do |num| 
    third_row << num.to_i
end

x = 0
current_color = "*"
i = 0
while (i < h) 
    j = 0
    while (j < w) 
        if third_row[x] == 0
            x += 1
            if current_color == "*"
                current_color = " "
            else
                current_color = "*"
            end
        end
        fax[i][j] = current_color
        third_row[x] -= 1
        j += 1
    end
    i += 1
end


fax.each do |row|
    row.unshift("|")
    row.push("|")
    puts row.join("")
end
