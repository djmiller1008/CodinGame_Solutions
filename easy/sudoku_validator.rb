@grid = Array.new(9) { Array.new }
@array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

(0..8).each do |i|
    inputs = gets.split(" ") 
    for j in 0..8
        n = inputs[j].to_i
        @grid[i] << n
    end
end

def rows?
    @grid.each do |row|
        if row.sort != @array
            return false
        end
    end
    true
end

def columns?
    @grid = @grid.transpose
    @grid.each do |col|
        if col.sort != @array
            return false
        end
    end
    true
end

def square?
    (0..8).each do |idx|
        square_array = []
        x = (idx / 3) * 3
        y = (idx % 3) * 3
  
        (x...x + 3).each do |i|
            (y...y + 3).each do |j|
                square_array << @grid[i][j]
            end
        end
        if square_array.sort != @array
            return false
        end
    end
    true
end

if rows? && columns? && square?
    puts true
else
    puts false
end