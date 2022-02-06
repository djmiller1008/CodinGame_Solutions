win = false
board = []
3.times do
    line = gets.chomp.split('')

    count = line.count('O')
    if count == 2 && line.count('X') != 1
        line = ['O', 'O', 'O']
        win = true
    end
    board << line
    
end

if win == true
    board.each do |row|
        puts row.join("")
    end
    return
end

board = board.transpose

board.each_with_index do |row, i|
    if row.count('O') == 2 && row.count('X') != 1
        board[i] = ['O', 'O', 'O']
        win = true
    end
end

board = board.transpose

if win == true
    board.each do |row|
        puts row.join("")
    end
    return
end

diagonal1 = [board[0][0], board[1][1], board[2][2]]
diagonal2 = [board[0][2], board[1][1], board[2][0]]

if diagonal1.count('O') == 2 && diagonal1.count('X') != 1
    board[0][0], board[1][1], board[2][2] = 'O', 'O', 'O'
    win = true
elsif diagonal2.count('O') == 2 && diagonal2.count('X') != 1
    board[0][2], board[1][1], board[2][0] = 'O', 'O', 'O'
    win = true
end

if win == true
    board.each do |row|
        puts row.join("")
    end
end


if win == false
    puts false
end


