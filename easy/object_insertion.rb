object = []
count = 0
current_object_coords = []
a, b = gets.split(" ").collect { |x| x.to_i }

a.times do
  object_line = gets.chomp.split("")
  object << object_line
end

grid = []
c, d = gets.split(" ").collect { |x| x.to_i }
c.times do
  grid_line = gets.chomp.split("")
  grid << grid_line
end

def does_it_all_fit?(object, grid, x, y, a, b, current_object_coords)
    object_x = 0
    for i in (x...x+a)
        object_y = 0
        for j in (y...y+b)
            if !can_fit?(grid[i][j], object[object_x][object_y])
                return false
            end

            current_object_coords << [i, j]
            object_y += 1
        end
        object_x += 1
    end
    true
end

def can_fit?(grid_char, object_char)
    if grid_char == "#" && object_char == "."
        return true
    elsif grid_char == "."
        return true
    end

    false
end

first_object_coords = []

for i in (0..c-a)
    for j in (0..d-b)
        if can_fit?(grid[i][j], object[0][0])
            if does_it_all_fit?(object, grid, i, j, a, b, current_object_coords)
                count += 1
                if count == 1
                    first_object_coords = current_object_coords
                    current_object_coords = []
                end
            else
                current_object_coords = []
            end

        end
    end
end

if count == 1
    object_coords_index = 0
    object.each do |row|
        row.each do |char|
            if char == "*"
                x = first_object_coords[object_coords_index][0]
                y = first_object_coords[object_coords_index][1]
                grid[x][y] = char
            end
            object_coords_index += 1
        end
    end
    puts 1
    grid.each do |row|
        puts row.join("")
    end

else
    puts count
end
